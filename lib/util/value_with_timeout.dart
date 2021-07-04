import 'dart:async';

import 'package:flutter/foundation.dart';

class ValueWithTimeout<T> {
  final Duration timeout;

  T? value;
  Timer? timer;

  ValueWithTimeout({required this.timeout});

  void renew(T newValue, void onChanged()) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(timeout, onChanged);
  }

  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}
