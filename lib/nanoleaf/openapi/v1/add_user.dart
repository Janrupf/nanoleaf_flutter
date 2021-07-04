import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class AddUserRequest extends ApiRequestV1<String> {
  @override
  String get method => "POST";

  @override
  List<String> get pathSegments => ["new"];

  @override
  bool get requiresAuthentication => false;

  @override
  Future<String> handleResponse(StreamedResponse response) async {
    if (response.statusCode != 200) {
      if (response.statusCode == 401 || response.statusCode == 403) {
        // User did not enable pairing mode
        throw ApiRequestException.withoutStatus(
            Intl.message("Device not in pairing mode"));
      } else {
        // Some other error occurred
        throw ApiRequestException(response.statusCode, response.reasonPhrase);
      }
    }

    // Parse the response as json
    final dynamic jsonResponse =
        await compute(jsonDecode, await response.stream.toStringStream().first);

    if (!(jsonResponse is Map<String, dynamic>)) {
      // The panel returned some json which does not match the expected format
      throw ApiRequestException.withoutStatus(
          Intl.message("Panel returned invalid response: $jsonResponse"));
    }

    final dynamic? token = jsonResponse["auth_token"];
    if (token == null) {
      // The panel returned json without including an auth_token
      throw ApiRequestException.withoutStatus(
          Intl.message("Panel did not include auth_token in the response"));
    }

    return token as String;
  }
}
