import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/models/address_with_port.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';
import 'package:pub_semver/pub_semver.dart';

part 'discovery_info.g.dart';

abstract class DiscoveryInfo
    implements Built<DiscoveryInfo, DiscoveryInfoBuilder> {
  static Serializer<DiscoveryInfo> get serializer => _$discoveryInfoSerializer;

  /// The IPv4 address and discovery port of the device.
  AddressWithPort get ipv4;

  /// The IPv6 address and discovery port of the device.
  AddressWithPort get ipv6;

  /// The name of the device.
  String get name;

  /// The model of the device, named `md` in the Json response.
  @BuiltValueField(wireName: "md")
  String get model;

  /// The ID of the device.
  NanoleafId get id;

  /// Unknown, named `c#` in the Json response.
  @BuiltValueField(wireName: "c#")
  int get cSharp;

  /// Unknown, named `s#` in the Json response.
  @BuiltValueField(wireName: "s#")
  int get getsSharp;

  /// Unknown
  int get ff;

  /// Unknown
  int get sf;

  /// Unknown
  int get ci;

  /// Firmware version of the device, named `srcvers` in the Json response.
  @BuiltValueField(wireName: "srcvers")
  Version get firmwareVersion;

  /// Unknown, looks like base64.
  String get sh;

  DiscoveryInfo._();

  factory DiscoveryInfo([void Function(DiscoveryInfoBuilder)? updates]) =
      _$DiscoveryInfo;
}
