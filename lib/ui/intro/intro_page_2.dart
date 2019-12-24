import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage2 extends StatefulWidget {
  static const routeName = "/onboarding";

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  final List<Widget> introWidgetsList = <Widget>[
    Container(
      color: Colors.white,
      child: SvgPicture.asset("assets/svg/undraw_a_day_off_w9ex.svg"),
    ),
    Container(
      color: Colors.white,
      child: SvgPicture.asset("assets/svg/undraw_online_everywhere_cd90.svg"),
    ),
    Container(
      color: Colors.white,
      child: SvgPicture.asset("assets/svg/undraw_a_day_off_w9ex.svg"),
    )
  ];

  PageController _pageController = PageController();
  var currentPageValue = 0;

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                itemCount: introWidgetsList.length,
                itemBuilder: (context, position) {
                  return introWidgetsList[position];
                },
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < introWidgetsList.length; i++)
                          if (i == currentPageValue) ...[circleBar(true)] else
                            circleBar(false),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                      child: Icon(Icons.arrow_right),
                    ),
                  ),
                ),
                visible: currentPageValue == introWidgetsList.length - 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
