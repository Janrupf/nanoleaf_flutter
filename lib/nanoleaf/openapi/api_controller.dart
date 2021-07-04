// TODO: Wait for this library to be migrated
// ignore: import_of_legacy_library_into_null_safe
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:nanoleaf_flutter/nanoleaf/device/device_base.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/client/improved_io_client.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/client/sse_io_client.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/open_events_stream.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

/// Response which is being driven by its own [http.Client].
///
/// This is required because there is no way to close a single request, which
/// makes it impossible to properly stream server sent events.
class IsolatedResponse<R> {
  final http.Client client;
  final R response;

  IsolatedResponse(this.client, this.response);
}

/// Helper class for sending and receiving requests from devices.
class ApiController {
  // TODO: Add web support
  /// The underlying http client.
  ///
  /// This needs a header preserving client because the Nanoleaf HTTP server
  /// cares for the case of headers (which is a bug on the Nanoleaf side!) and
  /// flutter makes them lowercase by default.
  final http.Client _client = HeaderPreservingIOClient();

  /// Sends a [request] to a [device] and returns a future wrapping the response.
  ///
  /// [R] is the successful response type of the request [request] of type [E]
  /// sent to the [device].
  Future<R> send<R>(DeviceBase device, ApiRequestV1<R> request) {
    final http.Request httpRequest =
        http.Request(request.method, _buildUrl(device, request));
    if (request.body != null) {
      // Set a body if required
      httpRequest.body = request.body!;
    }

    print("Sending $request to $device");
    // Send the http request and let the request handle the response.
    return _client.send(httpRequest).then(request.handleResponse,
        onError: (error) {
      if (error is SocketException) {
        // Try to somehow get a meaningful error message
        var message = error.message;
        if (message.isEmpty && error.osError != null) {
          message = error.osError!.message;
        }

        throw ApiRequestException.withoutStatus(message);
      } else {
        throw error;
      }
    });
  }

  /// Opens
  Stream<SSEEvent> openEventStream<R>(
      DeviceBase device, OpenEventsStreamRequest request) {
    final uri = _buildUrl(device, request);

    print("Opening SSE stream on device $device using $uri");
    return SSEIOClient.stream(uri.host, uri.port, "${uri.path}?${uri.query}");
  }

  /// Sends the **undocumented** `androidIdentify` request to the [device] on [port].
  Future androidIdentify(DeviceBase device, int port) {
    print("Sending android identify to ${device.address} on port $port");

    final uri = Uri(
        scheme: "http",
        host: device.address.address,
        port: port,
        pathSegments: ["identify-android"]);

    return _client.post(uri, headers: {"User-Agent": "Android"});
  }

  /// Builds the request [Uri] for the [request] for the [device].
  Uri _buildUrl<T extends ApiRequestV1<dynamic>>(DeviceBase device, T request) {
    List<String> pathSegments = ["api", "v1"];

    if (request.requiresAuthentication) {
      if (!(device is PairedDevice)) {
        throw ArgumentError(
            "Tried to send $request which requires authentication to a device which is not paired");
      }

      pathSegments.add(device.token);
    }

    pathSegments.addAll(request.pathSegments);

    return Uri(
        scheme: "http",
        host: device.address.address,
        port: device.port,
        pathSegments: pathSegments,
        query: request.query);
  }
}
