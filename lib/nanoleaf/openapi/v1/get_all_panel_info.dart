import 'package:nanoleaf_flutter/models/panel_info.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class GetAllPanelInfoRequest extends ApiRequestV1<PanelInfo> {
  @override
  String get method => "GET";

  @override
  List<String> get pathSegments => [];
}