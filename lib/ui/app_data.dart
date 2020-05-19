import 'dart:core';

import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void changeAppTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
