import 'package:nanoleaf_flutter/models/discovery_info.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';

class GetDiscoveryInfoRequest extends ApiRequestV1<DiscoveryInfo> {
  @override
  String get method => "GET";

  @override
  List<String> get pathSegments => ["discovery", "info"];

  @override
  bool get requiresAuthentication => false;
}
