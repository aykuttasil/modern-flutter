import 'package:flutter/material.dart';
import 'package:modern_flutter/ui/home/home_page.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 55.0),
                child: Image.asset(
                  "assets/images/aykutasil.jpg",
                  fit: BoxFit.cover,
                  width: 300,
                ),
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
