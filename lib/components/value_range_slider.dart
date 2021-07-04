import 'package:flutter/material.dart';
import 'package:nanoleaf_flutter/models/value_range.dart';

class ValueRangeSlider extends StatefulWidget {
  final IntValueRange range;
  final ValueChanged<int> onChanged;

  ValueRangeSlider({required this.range, required this.onChanged});

  @override
  _ValueRangeSliderState createState() =>
      _ValueRangeSliderState(range.value.toDouble());
}

class _ValueRangeSliderState extends State<ValueRangeSlider> {
  double _value;

  _ValueRangeSliderState(this._value);

  @override
  Widget build(BuildContext context) => Slider(
      value: _value.toDouble(),
      min: widget.range.min.toDouble(),
      max: widget.range.max.toDouble(),
      // divisions: _max - _min,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
        widget.onChanged(_value.toInt());
      });
}
