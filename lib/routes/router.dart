// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prepared_academy/views/exams_assignments/exam_assignments.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/home/navig.dart';
import 'package:prepared_academy/views/home/story_view.dart';
import 'package:prepared_academy/views/subjects/chapter_content.dart';
import 'package:prepared_academy/views/subjects/chapters.dart';
import 'package:prepared_academy/widgets/photo_view.dart';

import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const HOMESCREEN = '/home';
  static const NAVIG = '/navig';
  static const CHAPTERS = '/chapters';
  static const CHAPTERCONTENT = '/chaptercontent';
  static const EXAMSASSIGNMENTS = '/examsassignments';

  static const STORYVIEW = '/storyview';

  static const PHOTOVIEW = '/photoview';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
      HOMESCREEN: (context) => Home(),
      NAVIG: (context) => const Navig(),
      CHAPTERS: (context) => const Chapters(),
      CHAPTERCONTENT: (context) => const ChapterContent(),
      STORYVIEW: (context) => const StoryPage(),
      PHOTOVIEW: (context) => const ViewPhoto(),
      EXAMSASSIGNMENTS: (context) => const ExamsAndAssignments(),
    };
    return appRoutes;
  }
}
