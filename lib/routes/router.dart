// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/home/navig.dart';

import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const HOMESCREEN = '/home';
  static const NAVIG = '/navig';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
      HOMESCREEN: (context) => Home(),
      NAVIG: (context) => const Navig(),
    };
    return appRoutes;
  }
}
