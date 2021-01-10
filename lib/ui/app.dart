import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:provider/provider.dart';

import '../common/themes.dart';
import '../utils/routes/FadeRoute.dart';
import 'about/about_page.dart';
import 'app_data.dart';
import 'home/home_page.dart';
import 'intro/intro_page.dart';
import 'intro/intro_page_2.dart';
import 'login/login_page.dart';
import 'login/login_page_2.dart';
import 'login/login_page_3.dart';
import 'splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsObserver firebaseAnalyticsObserver =
        locator<FirebaseAnalyticsObserver>();

    return MaterialApp(
      title: 'Modern Flutter',
      theme: context.watch<AppData>().isDarkTheme ? darkTheme : lightTheme,
      initialRoute: HomePage.routeName,
      // onGenerateRoute: Router.generateRoute,
      routes: {
        IntroPage.routeName: (context) => IntroPage(),
        IntroPage2.routeName: (context) => IntroPage2(),
        SplashPage.routeName: (context) => SplashPage(),
        HomePage.routeName: (context) => HomePage(),
        AboutPage.routeName: (context) => AboutPage(),
        LoginPage.routeName: (context) => LoginPage(),
        LoginPage2.routeName: (context) => LoginPage2(),
        LoginPage3.routeName: (context) => LoginPage3(),
      },
      navigatorObservers: [firebaseAnalyticsObserver],
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return FadeRoute(page: SplashPage());
      case HomePage.routeName:
        return FadeRoute(page: HomePage());
      case AboutPage.routeName:
        //var post = settings.arguments as Post;
        return FadeRoute(page: AboutPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
