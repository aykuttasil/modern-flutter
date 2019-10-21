import 'package:flutter/material.dart';
import 'package:modern_flutter/states/AppState.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
          Container(
            child: Image(image: AssetImage('assets/images/aykutasil.jpg'))
          ),
          Text(appState.isDarkTheme() ? "isDarkkkk" : "isLight"),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () {
          appState.changeAppTheme(!appState.isDarkTheme());
        },
      ),
    );
  }
}
