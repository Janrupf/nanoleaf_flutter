import 'package:http/http.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class DeleteUserRequest extends ApiRequestV1 {
  @override
  String get method => "DELETE";

  @override
  List<String> get pathSegments => [];

  Future handleResponse(StreamedResponse response) async {
    // User deletion should return no content
    if (response.statusCode != 204) {
      throw ApiRequestException(response.statusCode, response.reasonPhrase);
    }
  }
}
