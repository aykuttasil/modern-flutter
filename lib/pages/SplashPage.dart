import 'package:flutter/material.dart';
import 'package:modern_flutter/pages/HomePage.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.blue,
          child: Text("Go Home"),
          onPressed: () {
            Navigator.pushNamed(context, HomePage.routeName);
          },
        ),
      ),
    );
  }
}
