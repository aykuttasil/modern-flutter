import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  // fontFamily: "Poppins",
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.red),
  ),
);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.red),
    bodyText2: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline1: TextStyle(color: Colors.black),
    caption: TextStyle(color: Colors.black),
  ),
  // fontFamily: "Poppins",
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.brown,
    textTheme: ButtonTextTheme.primary,
  ),
);
