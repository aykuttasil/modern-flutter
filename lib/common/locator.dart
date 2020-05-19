import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:get_it/get_it.dart';
import 'package:modern_flutter/ui/app_data.dart';
import 'package:modern_flutter/ui/home/home_data.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppData());

  locator.registerLazySingleton(() => FirebaseAnalytics());

  locator.registerLazySingleton(
      () => FirebaseAnalyticsObserver(analytics: locator<FirebaseAnalytics>()));


  locator.registerFactory(() => HomeData());
}
