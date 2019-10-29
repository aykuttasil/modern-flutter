import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/pages/AboutPage.dart';
import 'package:modern_flutter/states/AppState.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Modern Flutter"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(appState.isDarkTheme() ? "isDark" : "isLight"),
            RaisedButton(
              color: Colors.white54,
              child: Text("Press"),
              onPressed: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () {
          appState.changeAppTheme(!appState.isDarkTheme());
        },
      ),
    );
  }
}
