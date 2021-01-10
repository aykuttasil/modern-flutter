import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:modern_flutter/ui/app.dart';
import 'package:modern_flutter/ui/app_data.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  setupLocator();

  runZonedGuarded(() async {
    await SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => locator<AppData>()),
        ],
        child: App(),
      ),
    );
  }, (err, stack) {
    FirebaseCrashlytics.instance.recordError(err, stack);
  });
}
