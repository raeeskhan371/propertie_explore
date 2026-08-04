import 'dart:async';

import 'package:flutter/widgets.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void disbose() {
    _timer?.cancel();
  }

  Debouncer({required this.milliseconds});
}
