import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/pages/page.dart';

class SettingsPage extends ApplicationPage {
  @override
  Widget build(BuildContext context) => Text(Intl.message("Settings"));

  @override
  Icon get icon => Icon(Icons.settings);

  @override
  String get title => Intl.message("Settings");
}
