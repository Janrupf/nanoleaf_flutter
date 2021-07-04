import 'dart:io';

import 'package:built_value/serializer.dart';

class InternetAddressSerializer extends PrimitiveSerializer<InternetAddress> {
  @override
  InternetAddress deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InternetAddress(serialized as String);

  @override
  Object serialize(Serializers serializers, InternetAddress object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.address;

  @override
  Iterable<Type> get types => [InternetAddress];

  @override
  String get wireName => "InternetAddress";
}
