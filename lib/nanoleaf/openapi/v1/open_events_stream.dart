import 'package:http/http.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class OpenEventsStreamRequest extends ApiRequestV1<StreamedResponse> {
  final List<int> _ids;

  OpenEventsStreamRequest(
      {bool state = false,
      bool layout = false,
      bool effects = false,
      bool touch = false})
      : _ids = [] {
    if (state) _ids.add(1);
    if (layout) _ids.add(2);
    if (effects) _ids.add(3);
    if (touch) _ids.add(4);
  }

  @override
  String get method => "GET";

  @override
  List<String> get pathSegments => ["events"];

  @override
  String get query => "id=${_ids.join(',')}";

  @override
  Future<StreamedResponse> handleResponse(StreamedResponse response) {
    throw UnsupportedError("handleResponse called on OpenEventsStreamRequest! "
        "This should be handled by the SSE client");
  }
}
