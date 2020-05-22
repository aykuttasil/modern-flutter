import 'dart:core';
import 'package:modern_flutter/ui/base/base_data.dart';

class AppData extends BaseData {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void changeAppTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
