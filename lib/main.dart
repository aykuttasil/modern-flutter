import 'package:flutter/material.dart';
import 'package:modern_flutter/common/Themes.dart';
import 'package:modern_flutter/pages/HomePage.dart';
import 'package:modern_flutter/states/AppState.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        builder: (_) => AppState(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Modern Flutter',
          theme: appState.isDarkTheme() ? darkTheme : lightTheme,
          home: HomePage(),
        );
      },
    );
  }
}
