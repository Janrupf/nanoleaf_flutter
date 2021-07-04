import 'package:flutter/material.dart';

class StatefulSwitchListTile extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const StatefulSwitchListTile(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _StatefulSwitchListTileState(value, onChanged);
}

class _StatefulSwitchListTileState extends State<StatefulSwitchListTile> {
  bool _value;
  final ValueChanged<bool> _onChanged;

  _StatefulSwitchListTileState(this._value, this._onChanged);

  @override
  Widget build(BuildContext context) => SwitchListTile(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });

        _onChanged(_value);
      });
}
