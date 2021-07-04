// TODO: Wait for this library to be migrated
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nanoleaf_flutter/util/serializers.dart';

/// Exception which will be thrown if a request fails.
class ApiRequestException implements Exception {
  /// The status code of the request which failed, or null, if unknown.
  final int? statusCode;

  /// The exception message explaining what happened, or null, if unknown.
  final String? message;

  ApiRequestException.withoutStatus(this.message) : statusCode = null;
  ApiRequestException(this.statusCode, this.message);

  @override
  String toString() {
    return "HTTP Error: ${statusCode ?? "unknown"}: (${message ?? "unknown"})";
  }
}

/// Base class for all ApiV1 requests.
///
/// [R] is the response type of the request.
abstract class ApiRequestV1<R> {
  /// The path segments to append after the base path.
  List<String> get pathSegments;

  /// Determines whether this request requires to be authenticated already.
  ///
  /// This is true by default, as most requests do require authentication.
  bool get requiresAuthentication => true;

  /// The HTTP method this request is being sent as.
  String get method;

  /// The body of the request, or null, if none.
  String? get body => null;

  /// The query parameters to send with the request
  String? get query => null;

  /// Handles the [response] and parses it into [R].
  ///
  /// This method throws if the [response] can't be parsed.
  Future<R> handleResponse(StreamedResponse response) async {
    if(response.statusCode != 200) {
      throw ApiRequestException(response.statusCode, response.reasonPhrase);
    }

    return compute(
        deserializeJsonValueAsync, await response.stream.toStringStream().first);
  }
}
