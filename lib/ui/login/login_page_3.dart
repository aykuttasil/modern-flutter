import 'package:flutter/material.dart';
import 'package:modern_flutter/ui/widgets/linear_gradient_mask.dart';
import 'package:modern_flutter/ui/widgets/my_input.dart';
import 'package:modern_flutter/utils/ui_helper.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class LoginPage3 extends StatefulWidget {
  static const String routeName = "/login3";

  @override
  _LoginPage3State createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  @override
  Widget build(BuildContext context) {  
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          LinearGradientMask(
            child: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                constraints: BoxConstraints.expand(),
              ),
            ),
          ),
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              height: 250,
              width: 250,
              child: ClipPolygon(
                sides: 8,
                borderRadius: 25.0, // Default 0.0 degrees
                rotate: 20, // Default 0.0 degrees
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        UIHelper.APPLE_GRADIENT_COLOR_ONE,
                        UIHelper.APPLE_GRADIENT_COLOR_TWO,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              backgroundColor: UIHelper.WHITE,
              shape: PolygonBorder(
                sides: 8,
                borderRadius: 5.0, // Default 0.0 degrees
                border: BorderSide.none, // Default BorderSide.none
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.pink,
                size: 20,
              ),
              onPressed: () {},
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                ),
                Card(
                  color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          UIHelper.login.toUpperCase(),
                          style: TextStyle(
                            color: UIHelper.WHITE,
                            fontSize: UIHelper.dynamicSp(100),
                          ),
                        ),
                        MyInput(UIHelper.email, false, (value) {}),
                        MyInput(UIHelper.password, true, (value) {}),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );

    /*
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIHelper.WHITE,
        shape: PolygonBorder(
          sides: 8,
          borderRadius: 5.0, // Default 0.0 degrees
          border: BorderSide.none, // Default BorderSide.none
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.pink,
          size: 20,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          LinearGradientMask(
            child: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                constraints: BoxConstraints.expand(),
              ),
            ),
          ),
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              height: 250,
              width: 250,
              child: ClipPolygon(
                sides: 8,
                borderRadius: 25.0, // Default 0.0 degrees
                rotate: 20, // Default 0.0 degrees
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        UIHelper.APPLE_GRADIENT_COLOR_ONE,
                        UIHelper.APPLE_GRADIENT_COLOR_TWO,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
              ),
              Text(
                UIHelper.login.toUpperCase(),
                style: TextStyle(
                  color: UIHelper.WHITE,
                  fontSize: UIHelper.dynamicSp(100),
                ),
              ),
              MyInput(UIHelper.email, false, (value) {}),
              MyInput(UIHelper.password, true, (value) {}),
            ],
          ),
        ],
      ),
    );
    */
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;

    // create a path
    var path = Path();
    path.moveTo(0, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.14,
        size.width * 0.45, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.39, size.width, size.height * 0.58);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
