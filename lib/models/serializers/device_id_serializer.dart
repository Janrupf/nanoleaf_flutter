import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';

/// Serializer for [NanoleafId] instances.
class DeviceIdSerializer implements PrimitiveSerializer<NanoleafId> {
  @override
  NanoleafId deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NanoleafId(serialized as String);

  @override
  Object serialize(Serializers serializers, NanoleafId object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.toString();

  @override
  Iterable<Type> get types => [NanoleafId];

  @override
  String get wireName => "NanoleafId";
}
