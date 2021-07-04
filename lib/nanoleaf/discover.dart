import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/discovery_device.dart';

/// IPv4 Multicast address
final InternetAddress ipv4MulticastAddress = InternetAddress("239.255.255.250");

/// IPv6 Multicast address
final InternetAddress ipv6MulticastAddress = InternetAddress("FF05::C");

/// UDP M-SEARCH SSDP message for prompting SSDP responses from Nanoleafs.
const String SEARCH_MESSAGE = "M-SEARCH * HTTP/1.1\r\n"
    "HOST: 239.255.255.250:1900\r\n"
    "MAN: \"\ssdp:discover\"\r\n"
    "MX: 0\r\n"
    "ST: nanoleaf_aurora:light\r\n"
    "USER-AGENT: NanoleafFlutter/1.0\r\n"
    "\r\n";

/// UTF8 encoded UDP M-SEARCH SSDP message.
final searchMessageData = utf8.encode(SEARCH_MESSAGE);

/// Function callback when a new device has been discovered.
typedef void DeviceDiscoveredCallback(DiscoveredDevice device);

/// Exception thrown in case the [DeviceDiscovery.start] method is called twice
/// without calling [DeviceDiscovery.stop] is called or vice-versa.
class InvalidDiscoveryStateException implements Exception {
  final String message;

  InvalidDiscoveryStateException(this.message);
}

/// Class used for Nanoleaf discovery.
class DeviceDiscovery {
  final List<RawDatagramSocket> _openedSockets = [];
  final List<NetworkInterface> _networkInterfaces = [];

  /// Callback to be invoked when a device has been discovered.
  DeviceDiscoveredCallback? discoveredCallback;

  Timer? _searchMessageTimer;

  /// Starts the device discovery.
  Future start() async {
    if (_searchMessageTimer != null) {
      throw InvalidDiscoveryStateException(
          "Called start() twice without calling stop()");
    }

    if (discoveredCallback == null) {
      throw InvalidDiscoveryStateException(
          "start() called without setting a discoveredCallback");
    }

    if (NetworkInterface.listSupported) {
      _networkInterfaces.addAll(await NetworkInterface.list());
    }

    final supportsIpv4 = _interfaceAvailableFor(InternetAddressType.IPv4);
    final supportsIpv6 = _interfaceAvailableFor(InternetAddressType.IPv6);

    print("IPv4 interfaces available: $supportsIpv4");
    if (supportsIpv4) {
      await _newSocket(InternetAddress.anyIPv4);
    }

    print("IPv6 interfaces available: $supportsIpv6");
    if (supportsIpv6) {
      await _newSocket(InternetAddress.anyIPv6);
    }

    _sendSearchMessage();
    _searchMessageTimer =
        Timer.periodic(Duration(seconds: 10), _sendSearchMessage);
  }

  /// Determines whether there is any interface available for the address [type].
  bool _interfaceAvailableFor(InternetAddressType type) {
    if (_networkInterfaces.length < 1) {
      print("Assuming there is an interface available for $type "
          "because interface listing did not succeed");
      return true;
    }

    return _networkInterfaces
        .any((interface) => _interfaceSupports(interface, type));
  }

  /// Determines whether the [interface] supports the [type].
  bool _interfaceSupports(
          NetworkInterface interface, InternetAddressType type) =>
      interface.addresses.any((address) => address.type == type);

  /// Creates a new listening socket bound to [address].
  Future _newSocket(InternetAddress address) async {
    // Set up the socket
    final socket = await RawDatagramSocket.bind(address, 0);
    socket.broadcastEnabled = true;
    socket.readEventsEnabled = true;
    socket.multicastHops = 50;

    // Add the event handler and join multicast
    socket.listen((event) => _handleSocketEvent(socket, event));
    _joinMulticast(socket);

    // Remember the socket so there is no leak
    _openedSockets.add(socket);
  }

  /// Tries to join [socket] to all available multicast groups.
  void _joinMulticast(RawDatagramSocket socket) {
    for (var multicastAddress in [ipv4MulticastAddress, ipv6MulticastAddress]) {
      if (socket.address.type == multicastAddress.type) {
        try {
          socket.joinMulticast(multicastAddress);
          print(
              "Joined multicast on $multicastAddress without bound interface");
        } on OSError catch (e) {
          print("Failed to join multicast on address $multicastAddress "
              "without any bound interface: $e");
        }

        for (var interface in _networkInterfaces) {
          if (_interfaceSupports(interface, multicastAddress.type)) {
            try {
              socket.joinMulticast(multicastAddress, interface);
              print(
                  "Joined multicast on $multicastAddress bound to interface $interface");
            } on OSError catch (e) {
              print("Failed to join multicast on address $multicastAddress "
                  "using interface $interface: $e");
            }
          }
        }
      }
    }
  }

  void _handleSocketEvent(RawDatagramSocket socket, RawSocketEvent event) {
    switch (event) {
      case RawSocketEvent.read:
        // Read the packet and keep events enabled
        final packet = socket.receive();
        socket.writeEventsEnabled = true;
        socket.readEventsEnabled = true;

        if (packet == null) {
          // Null packets are not interesting
          return;
        }

        // Decode packet
        final String message;
        try {
          message = utf8.decode(packet.data);
        } on FormatException catch (e) {
          print(
              "Failed to decode UDP multicast due to invalid UTF8: ${e.message}");
          return;
        }

        final lines = message.split("\r\n");

        // Validity checks
        if (lines.length < 1) {
          print("Received empty UDP multicast");
          return;
        } else if (!lines[0].startsWith("HTTP/1.1")) {
          print("Received UDP multicast which is not HTTP/1.1");
          return;
        }

        Map<String, String> headers = new Map();
        for (final line in lines) {
          if (line.startsWith("HTTP/1.1") || line.isEmpty) {
            // HTTP heads may contain empty lines
            continue;
          }

          final separatorIndex = line.indexOf(':');
          if (separatorIndex < 0) {
            // Invalid header
            print("Received HTTP header without a separator: $line");
            continue;
          }

          // Split the HTTP header into key and value
          headers[line.substring(0, separatorIndex).trim()] =
              line.substring(separatorIndex + 1).trim();
        }

        if (headers.containsKey("ST") && headers.containsKey("Location")) {
          final st = headers["ST"]!.toLowerCase();
          final location = Uri.tryParse(headers["Location"]!);
          final id = headers["nl-deviceid"];
          final name = headers["nl-devicename"];

          if ((st == "nanoleaf_aurora:light" || st == "nanoleaf:nl29") &&
              location != null &&
              id != null) {
            // Notify the listener that a device has been discovered
            discoveredCallback!(DiscoveredDevice(
                NanoleafId(id),
                name != null ? name : id,
                InternetAddress(location.host),
                location.port));
          }
        }
        break;

      case RawSocketEvent.write:
        break;
    }
  }

  /// Stops all discovery mechanisms and closes opened resources.
  void stop() {
    if (_searchMessageTimer == null) {
      throw InvalidDiscoveryStateException(
          "stop() called without calling start()");
    }

    for (var socket in _openedSockets) {
      socket.close();
    }

    _searchMessageTimer!.cancel();
    _searchMessageTimer = null;

    _openedSockets.clear();
    _networkInterfaces.clear();
  }

  /// Sends an M-SEARCH message targeted at Nanoleafs.
  void _sendSearchMessage([_]) {
    print("Sending M-SEARCH message");

    for (var socket in _openedSockets) {
      try {
        if (socket.address.type == ipv4MulticastAddress.type) {
          print("Sending IPv4 M-SEARCH");
          // Send the M-SEARCH message on IPv4 multicast
          socket.send(searchMessageData, ipv4MulticastAddress, 1900);
        } else if (socket.address.type == ipv6MulticastAddress.type) {
          print("Sending IPv6 M-SEARCH");
          // Send the M-SEARCH message on IPv6 multicast
          socket.send(searchMessageData, ipv4MulticastAddress, 1900);
        }
      } on SocketException catch (e) {
        print("Failed to send IPv6 M-SEARCH message: ${e.message}");
        socket.close();
        _openedSockets.remove(socket);
      }
    }
  }
}
