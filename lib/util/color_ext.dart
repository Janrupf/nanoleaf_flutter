import 'dart:ui';

import 'package:flutter/painting.dart';

extension ColorUtil on Color {
  HSVColor toHSV() {
    return HSVColor.fromColor(this);
  }
}
