// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/home/navig.dart';
import 'package:prepared_academy/views/subjects/chapter_content.dart';
import 'package:prepared_academy/views/subjects/chapters.dart';

import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const HOMESCREEN = '/home';
  static const NAVIG = '/navig';
  static const CHAPTERS = '/chapters';
  static const CHAPTERCONTENT = '/chaptercontent';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
      HOMESCREEN: (context) => Home(),
      NAVIG: (context) => const Navig(),
      CHAPTERS: (context) => const Chapters(),
      CHAPTERCONTENT: (context) => const ChapterContent(),
    };
    return appRoutes;
  }
}
