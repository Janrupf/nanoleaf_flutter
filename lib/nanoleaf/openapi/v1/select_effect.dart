import 'package:http/http.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class SetEffectRequest extends ApiRequestV1 {
  final String effect;

  @override
  String get method => "PUT";

  @override
  List<String> get pathSegments => ["effects"];

  SetEffectRequest(this.effect);

  @override
  String? get body => "{\"select\": \"$effect\"}";

  Future handleResponse(StreamedResponse response) async {
    if(response.statusCode != 204) {
      throw ApiRequestException(response.statusCode, response.reasonPhrase);
    }
  }
}
