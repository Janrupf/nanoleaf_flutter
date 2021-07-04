import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';

/// Serializer for [ColorMode] instances.
class ColorModeSerializer implements PrimitiveSerializer<ColorMode> {
  @override
  ColorMode deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    ColorMode? mode = ColorModeExt.tryFromString(serialized as String);
    if (mode == null) {
      throw ArgumentError("Invalid color mode $serialized");
    }

    return mode;
  }

  @override
  Object serialize(Serializers serializers, ColorMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.toNanoleafValue();

  @override
  Iterable<Type> get types => [ColorMode];

  @override
  String get wireName => "ColorMode";
}
