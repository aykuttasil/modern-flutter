import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:modern_flutter/ui/App.dart';
import 'package:modern_flutter/ui/AppViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  setupLocator();
  runZoned<Future<void>>(() async {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<AppViewModel>()),
      ],
      child: App(),
    ));
  }, onError: Crashlytics.instance.recordError);
}
