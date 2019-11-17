import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/common/themes.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:modern_flutter/ui/AppViewModel.dart';
import 'package:modern_flutter/ui/about/AboutPage.dart';
import 'package:modern_flutter/ui/home/HomePage.dart';
import 'package:modern_flutter/ui/splash/SplashPage.dart';
import 'package:modern_flutter/utils/routes/FadeRoute.dart';
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
           // onGenerateRoute: Router.generateRoute,
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
