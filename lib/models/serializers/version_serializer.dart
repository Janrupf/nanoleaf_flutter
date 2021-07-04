import 'package:built_value/serializer.dart';
import 'package:pub_semver/pub_semver.dart';

/// Serializer for [Version] instances.
class VersionSerializer implements PrimitiveSerializer<Version> {
  @override
  Version deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Version.parse(serialized as String);

  @override
  Object serialize(Serializers serializers, Version object,
      {FullType specifiedType = FullType.unspecified}) => object.toString();

  @override
  Iterable<Type> get types => [Version];

  @override
  String get wireName => "Version";
}
