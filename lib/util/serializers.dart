import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:nanoleaf_flutter/models/address_with_port.dart';
import 'package:nanoleaf_flutter/models/device_meta.dart';
import 'package:nanoleaf_flutter/models/discovery_info.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';
import 'package:nanoleaf_flutter/models/serializers/color_mode_serializer.dart';
import 'package:nanoleaf_flutter/models/serializers/device_id_serializer.dart';
import 'package:nanoleaf_flutter/models/serializers/internet_address_serializer.dart';
import 'package:nanoleaf_flutter/models/serializers/shape_type_serializer.dart';
import 'package:nanoleaf_flutter/models/serializers/version_serializer.dart';
import 'package:nanoleaf_flutter/models/value_range.dart';

part "serializers.g.dart";

@SerializersFor([
  AddressWithPort,
  DeviceMeta,
  DiscoveryInfo,
  PanelInfo,
  DeviceEffects,
  PanelLayout,
  LayoutData,
  PositionData,
  ExtendedPositionData,
  RhythmInfo,
  PanelState,
  PowerState,
  IntValueRange
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(ColorModeSerializer())
      ..add(DeviceIdSerializer())
      ..add(InternetAddressSerializer())
      ..add(ShapeTypeSerializer())
      ..add(VersionSerializer()))
    .build();

/// Serializes a [value] of the type [T] to a Json string.
String serializeJsonValue<T extends Object>(T value) {
  return jsonEncode(
      serializers.serializeWith(serializers.serializerForType(T)!, value));
}

/// Deserializes Json [serialized] into a value of the type [T].
T deserializeJsonValue<T extends Object>(String serialized) {
  return deserializeDecoded<T>(jsonDecode(serialized));
}

/// Deserializes Json [serialized] into a list of values of the type [T].
List<T> deserializeJsonList<T>(String serialized) {
  final value = jsonDecode(serialized);

  return value
      .map((value) =>
          serializers.deserializeWith(serializers.serializerForType(T)!, value))
      .toList(growable: false)
      .cast<T>();
}

/// Deserializes Json [serialized] into a value of the type [T].
Future<T> deserializeJsonValueAsync<T>(String serialized) async {
  return deserializeDecoded<T>(jsonDecode(serialized));
}

/// Deserializes an already Json decoded value into a value of the type [T].
T deserializeDecoded<T>(Object decoded) {
  return serializers.deserializeWith(
      serializers.serializerForType(T) as Serializer<Object>, decoded) as T;
}

/// Deserializes an already Json decoded value into a value of the type [T].
Future<T> deserializeDecodedAsync<T>(Object decoded) async {
  return deserializeDecoded(decoded);
}
