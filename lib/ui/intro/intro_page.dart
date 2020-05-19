import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_flutter/ui/home/home_page.dart';
import 'package:modern_flutter/ui/login/login_page.dart';
import 'package:modern_flutter/ui/widgets/my_button.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController pageController;
  final List<String> listPath = [
    "assets/svg/undraw_a_day_off_w9ex.svg",
    "assets/svg/undraw_online_everywhere_cd90.svg"
  ];
  double sliderValue = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Expanded(
              child: PageView.builder(
                pageSnapping: false,
                itemBuilder: (context, position) {
                  return SvgPicture.asset(
                    listPath[position],
                    alignment: Alignment.topCenter,
                  );
                },
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: listPath.length,
                controller: pageController,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Slider(
                      value: sliderValue,
                      onChanged: (value) {
                        // logger.d(value);
                        setState(() {
                          sliderValue = value;
                          pageController.jumpTo(value * w / 2);
                        });
                      },
                      max: listPath.length.toDouble(),
                    ),
                    Expanded(child: SizedBox()),
                    MyButton(
                      title: "Go Go Go",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName);
                      },
                    ),
                    MyButton(
                      title: "LOGIN",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
