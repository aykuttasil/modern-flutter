import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/common/Themes.dart';
import 'package:modern_flutter/pages/AboutPage.dart';
import 'package:modern_flutter/pages/HomePage.dart';
import 'package:modern_flutter/pages/SplashPage.dart';
import 'package:modern_flutter/states/AppState.dart';
import 'package:provider/provider.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => AppState()),
        Provider<FirebaseAnalytics>(builder: (_) => FirebaseAnalytics()),
        ProxyProvider<FirebaseAnalytics, FirebaseAnalyticsObserver>(
          builder: (context, analytics, analyticsObserver) =>
              FirebaseAnalyticsObserver(analytics: analytics),
        )
      ],
      child: MyApp(),
    ));
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsObserver firebaseAnalyticsObserver =
        Provider.of<FirebaseAnalyticsObserver>(context);
    return Consumer<AppState>(
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
