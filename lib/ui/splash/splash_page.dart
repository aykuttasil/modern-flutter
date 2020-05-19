import 'package:flutter/material.dart';
import 'package:modern_flutter/ui/home/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
