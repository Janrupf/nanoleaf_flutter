import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';

class ShapeTypeSerializer implements PrimitiveSerializer<ShapeType> {
  @override
  ShapeType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShapeTypeInfoExt.fromId(serialized as int);

  @override
  Object serialize(Serializers serializers, ShapeType object,
      {FullType specifiedType = FullType.unspecified}) => object.id;

  @override
  Iterable<Type> get types => [ShapeType];

  @override
  String get wireName => "ShapeType";
}
