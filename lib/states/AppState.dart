import 'package:flutter/material.dart';

class AppState with ChangeNotifier {

  bool _isDarkTheme = false;

  bool isDarkTheme() => _isDarkTheme;

  void changeAppTheme(bool isDark) {
    _isDarkTheme = isDark;
    notifyListeners();
  }

}