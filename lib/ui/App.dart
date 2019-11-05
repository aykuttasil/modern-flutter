import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/common/Themes.dart';
import 'package:modern_flutter/ui/AppViewModel.dart';
import 'package:modern_flutter/ui/about/AboutPage.dart';
import 'package:modern_flutter/ui/home/HomePage.dart';
import 'package:modern_flutter/ui/splash/SplashPage.dart';
import 'package:modern_flutter/locator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsObserver firebaseAnalyticsObserver =
        locator<FirebaseAnalyticsObserver>();

    return Consumer<AppViewModel>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Modern Flutter',
          theme: appState.isDarkTheme() ? darkTheme : lightTheme,
          initialRoute: SplashPage.routeName,
          routes: {
            SplashPage.routeName: (context) => SplashPage(),
            HomePage.routeName: (context) => HomePage(),
            AboutPage.routeName: (context) => AboutPage(),
          },
          navigatorObservers: [firebaseAnalyticsObserver],
        );
      },
    );
  }
}
