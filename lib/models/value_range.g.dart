// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_range.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IntValueRange> _$intValueRangeSerializer =
    new _$IntValueRangeSerializer();

class _$IntValueRangeSerializer implements StructuredSerializer<IntValueRange> {
  @override
  final Iterable<Type> types = const [IntValueRange, _$IntValueRange];
  @override
  final String wireName = 'IntValueRange';

  @override
  Iterable<Object?> serialize(Serializers serializers, IntValueRange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'max',
      serializers.serialize(object.max, specifiedType: const FullType(int)),
      'min',
      serializers.serialize(object.min, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  IntValueRange deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IntValueRangeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'max':
          result.max = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'min':
          result.min = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$IntValueRange extends IntValueRange {
  @override
  final int value;
  @override
  final int max;
  @override
  final int min;

  factory _$IntValueRange([void Function(IntValueRangeBuilder)? updates]) =>
      (new IntValueRangeBuilder()..update(updates)).build();

  _$IntValueRange._({required this.value, required this.max, required this.min})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'IntValueRange', 'value');
    BuiltValueNullFieldError.checkNotNull(max, 'IntValueRange', 'max');
    BuiltValueNullFieldError.checkNotNull(min, 'IntValueRange', 'min');
  }

  @override
  IntValueRange rebuild(void Function(IntValueRangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntValueRangeBuilder toBuilder() => new IntValueRangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntValueRange &&
        value == other.value &&
        max == other.max &&
        min == other.min;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, value.hashCode), max.hashCode), min.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IntValueRange')
          ..add('value', value)
          ..add('max', max)
          ..add('min', min))
        .toString();
  }
}

class IntValueRangeBuilder
    implements Builder<IntValueRange, IntValueRangeBuilder> {
  _$IntValueRange? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  int? _max;
  int? get max => _$this._max;
  set max(int? max) => _$this._max = max;

  int? _min;
  int? get min => _$this._min;
  set min(int? min) => _$this._min = min;

  IntValueRangeBuilder();

  IntValueRangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _max = $v.max;
      _min = $v.min;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntValueRange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntValueRange;
  }

  @override
  void update(void Function(IntValueRangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IntValueRange build() {
    final _$result = _$v ??
        new _$IntValueRange._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'IntValueRange', 'value'),
            max: BuiltValueNullFieldError.checkNotNull(
                max, 'IntValueRange', 'max'),
            min: BuiltValueNullFieldError.checkNotNull(
                min, 'IntValueRange', 'min'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
