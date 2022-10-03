// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
    };
    return appRoutes;
  }
}
