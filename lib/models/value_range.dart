import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'value_range.g.dart';

abstract class IntValueRange implements Built<IntValueRange, IntValueRangeBuilder> {
  static Serializer<IntValueRange> get serializer => _$intValueRangeSerializer;

  /// Current value
  int get value;

  /// Maximum value
  int get max;

  /// Minimum value
  int get min;

  IntValueRange._();

  factory IntValueRange([void Function(IntValueRangeBuilder)? updates]) =
  _$IntValueRange;
}