import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.addOval(
      Rect.fromCenter(
          width: 100, height: 100, center: Offset(size.width - 50, 50)),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                constraints:
                    BoxConstraints.expand(width: double.infinity, height: 300),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Icon(Icons.add),
              ),
            ),
            Text(
              "Aykut Asil",
              style: Theme.of(context).textTheme.title,
            ),
            Text("Aykut Asil"),
          ],
        ),
      ),
    );
  }
}
