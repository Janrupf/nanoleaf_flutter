import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:nanoleaf_flutter/models/device_meta.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/discovery_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/discover.dart';
import 'package:nanoleaf_flutter/util/config.dart';
import 'package:nanoleaf_flutter/util/list_change_notifier.dart';

/// Application global device manager instance.
class DeviceManager {
  final ApplicationConfig config;
  final DeviceDiscovery _discovery = DeviceDiscovery();
  final ListChangeNotifier<PairedDevice> _paired = ListChangeNotifier();

  /// Constructs a new device manager and loads saved devices from disk.
  DeviceManager(this.config) {
    _loadFromDisk();
  }

  /// Open a stream for device discovery.
  Stream<DiscoveredDevice> discoveryStream() {
    if (_discovery.discoveredCallback != null) {
      throw InvalidDiscoveryStateException(
          "Tried to open a second discovery stream");
    }

    // The controller is closed, but the analyzer is unable to detect that.
    // ignore: close_sinks
    StreamController<DiscoveredDevice>? controller;

    // Create a new stream controller supporting all possible operations.
    controller = StreamController(
        onListen: _discovery.start,
        onPause: _discovery.stop,
        onResume: _discovery.start,
        onCancel: () {
          // Final stop, tear down the discovery and then also the stream
          _discovery.stop();
          _discovery.discoveredCallback = null;
          controller!.close();
        });

    final alreadyDiscovered = Set<DiscoveredDevice>();

    // Set a new discovered callback which points to the current stream
    _discovery.discoveredCallback = (discovered) {
      for (final device in alreadyDiscovered) {
        if (device.id == discovered.id) {
          return;
        }
      }

      for (final device in _paired) {
        if (device.id == discovered.id) {
          return;
        }
      }

      alreadyDiscovered.add(discovered);
      controller!.add(discovered);
    };

    return controller.stream;
  }

  /// Registers a paired device with this manager and saves the device config
  /// later.
  void register(PairedDevice device) {
    _paired.add(device);
    _saveToDisk();
  }

  void deregister(PairedDevice device) {
    _paired.remove(device);
    _saveToDisk();
  }

  /// Retrieves the change notifier for the list of devices
  ListChangeNotifier<PairedDevice> pairedDevices() {
    return _paired;
  }

  /// Loads the devices from disk.
  void _loadFromDisk() async {
    final meta = await config.loadList<DeviceMeta>("devices");
    if (meta == null) {
      // No devices saved yet
      return;
    }

    // Convert all metas
    meta.forEach((meta) => _paired.add(PairedDevice.fromMeta(meta)));
  }

  /// Saves the devices list to disk.
  void _saveToDisk() async {
    config.save("devices",
        BuiltList<DeviceMeta>.from(_paired.map((device) => device.toMeta())));
  }

  /// Disposes all resources owned by this device manager.
  void dispose() {
    _paired.dispose();
  }
}
