import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_flutter/ui/home/HomePage.dart';
import 'package:modern_flutter/ui/widgets/MyButton.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController;
  List<String> _listPath = [
    "assets/svg/undraw_a_day_off_w9ex.svg",
    "assets/svg/undraw_online_everywhere_cd90.svg"
  ];
  double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
                    _listPath[position],
                    alignment: Alignment.topCenter,
                  );
                },
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _listPath.length,
                controller: _pageController,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        // logger.d(value);
                        setState(() {
                          _sliderValue = value;
                          _pageController.jumpTo(value * w / 2);
                        });
                      },
                      max: _listPath.length.toDouble(),
                    ),
                    Expanded(child: SizedBox()),
                    MyButton(
                      title: "Go Go Go",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName);
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

    /*
    return PageView(
      children: <Widget>[
        Container(color: Colors.brown),
        Container(color: Colors.black),
        Container(color: Colors.cyan)
      ],
    );
       */
  }

  Widget _buildFirstPage() {
    return Container();
  }
}
