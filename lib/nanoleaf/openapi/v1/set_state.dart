import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class SetStateRequest extends ApiRequestV1 {
  final String? path;
  final String body;

  SetStateRequest._(this.path, this.body);

  factory SetStateRequest._boolValue(String key, bool value) =>
      SetStateRequest._(key, '{"$key": {"value": $value}}');

  factory SetStateRequest._intValue(String key, int value) =>
      SetStateRequest._(key, '{"$key": {"value": $value}}');

  static SetStateRequest on(bool value) =>
      SetStateRequest._boolValue("on", value);

  static SetStateRequest brightness(int value) =>
      SetStateRequest._intValue("brightness", value);

  static SetStateRequest hue(int value) =>
      SetStateRequest._intValue("hue", value);

  static SetStateRequest saturation(int value) =>
      SetStateRequest._intValue("sat", value);

  static SetStateRequest colorTemperature(int value) =>
      SetStateRequest._intValue("ct", value);

  static SetStateRequest color(HSVColor color) =>
      SetStateRequest._multiValue({
        "hue": color.hue.toInt(),
        "sat": (color.saturation * 100).toInt(),
        "brightness": (color.value * 100).toInt()
      });

  static SetStateRequest _multiValue(Map<String, Object> values) {
    var content = "{";

    values.forEach((key, value) {
      content += "\"$key\": {\"value\": $value},";
    });

    if (content.endsWith(",")) {
      content = content.substring(0, content.length - 1);
    }

    content += "}";

    return SetStateRequest._(null, content);
  }

  @override
  String get method => "PUT";

  @override
  List<String> get pathSegments => path != null ? ["state", path!] : ["state"];

  @override
  Future handleResponse(StreamedResponse response) {
    if (response.statusCode != 200 && response.statusCode != 204) {
      return Future.error(
          ApiRequestException(response.statusCode, response.reasonPhrase));
    }

    return Future.value();
  }
}
