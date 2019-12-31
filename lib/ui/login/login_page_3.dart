import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_flutter/ui/login/login_page_2.dart';
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
    ScreenUtil.instance.init(context);
    return Scaffold(
      floatingActionButton: floatingActionBottom,
      resizeToAvoidBottomPadding: false,
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
                borderRadius: 15.0, // Default 0.0 degrees
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
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 300, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      UIHelper.login.toUpperCase(),
                      style: TextStyle(
                        color: UIHelper.WHITE,
                        fontSize: UIHelper.dynamicSp(100),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _textField(UIHelper.email, false),
                        _textField(UIHelper.password, true),
                        new ForgetPasswordButton(
                          color: UIHelper.WHITE,
                          rightPadding: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textField(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 40, 10),
        child: TextField(
          style: TextStyle(color: UIHelper.WHITE),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          cursorColor: UIHelper.WHITE,
          maxLines: 1,
          decoration: InputDecoration(
            border: new UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white)),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );
}

Widget get floatingActionBottom => FloatingActionButton(
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
    );

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

class DrawPoligon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            UIHelper.APPLE_GRADIENT_COLOR_ONE,
            UIHelper.APPLE_GRADIENT_COLOR_TWO,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
