import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

/// A `dart:io`-based HTTP client.
///
/// Extended to preserve the casing because the Nanoleaf HTTP server is not
/// standard compliant and relies on the casing of headers.
///
/// This is a direct copy of [IOClient] except for the changes indicated above.
class HeaderPreservingIOClient extends BaseClient {
  /// The underlying `dart:io` HTTP client.
  HttpClient? _inner;

  HeaderPreservingIOClient([HttpClient? inner])
      : _inner = inner ?? HttpClient() {
    _inner!.connectionTimeout = Duration(seconds: 5);
  }

  /// Sends an HTTP request and asynchronously returns the response.
  @override
  Future<IOStreamedResponse> send(BaseRequest request) async {
    var stream = request.finalize();

    try {
      var ioRequest = (await _inner!.openUrl(request.method, request.url))
        ..followRedirects = request.followRedirects
        ..maxRedirects = request.maxRedirects
        ..contentLength = (request.contentLength ?? -1)
        ..persistentConnection = request.persistentConnection;
      request.headers.forEach((name, value) {
        // CHANGED HERE: `preserveHeaderCase => true`
        ioRequest.headers.set(name, value, preserveHeaderCase: true);
      });

      var response = await stream.pipe(ioRequest);

      var headers = <String, String>{};
      response.headers.forEach((key, values) {
        headers[key] = values.join(',');
      });

      return IOStreamedResponse(
          response.handleError((error) {
            final httpException = error as HttpException;
            throw ClientException(httpException.message, httpException.uri);
          }, test: (error) => error is HttpException),
          response.statusCode,
          contentLength:
          response.contentLength == -1 ? null : response.contentLength,
          request: request,
          headers: headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
          inner: response);
    } on HttpException catch (error) {
      throw ClientException(error.message, error.uri);
    }
  }

  /// Closes the client.
  ///
  /// Terminates all active connections. If a client remains unclosed, the Dart
  /// process may not terminate.
  @override
  void close() {
    if (_inner != null) {
      _inner!.close(force: true);
      _inner = null;
    }
  }
}
