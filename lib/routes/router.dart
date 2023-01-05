// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prepared_academy/views/auth/login.dart';
import 'package:prepared_academy/views/auth/pin_code.dart';
import 'package:prepared_academy/views/auth/register.dart';
import 'package:prepared_academy/views/class_activities/chapter_video/quiz_acitvity.dart';
import 'package:prepared_academy/views/exams_assignments/exam_assignments.dart';
import 'package:prepared_academy/views/class_activities/activities.dart';
import 'package:prepared_academy/views/class_activities/assignment/assignment_activity.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/home/navig.dart';
import 'package:prepared_academy/views/home/notifications.dart';
import 'package:prepared_academy/views/home/story_view.dart';
import 'package:prepared_academy/views/class_activities/subject_activity.dart';
import 'package:prepared_academy/views/live_quiz/live_quiz.dart';
import 'package:prepared_academy/views/subjects/chapter_content.dart';
import 'package:prepared_academy/views/subjects/chapter_test.dart';
import 'package:prepared_academy/views/subjects/chapters.dart';
import 'package:prepared_academy/views/subjects/pdf_viewer.dart';
import 'package:prepared_academy/views/subjects/slides.dart';
import 'package:prepared_academy/views/subjects/write_answer.dart';
import 'package:prepared_academy/widgets/photo_view.dart';
import '../views/auth/forgotpassword.dart';
import '../views/auth/new_password.dart';
import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const HOMESCREEN = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const NAVIG = '/navig';
  static const CHAPTERS = '/chapters';
  static const CHAPTERCONTENT = '/chaptercontent';
  static const EXAMSASSIGNMENTS = '/examsassignments';
  static const SLIDES = '/slides';
  static const PDFVIEW = '/pdfview';
  static const CHAPTERTEST = '/chaptertest';
  static const STORYVIEW = '/storyview';
  static const WRITEANSWER = '/writeanswer';
  static const PHOTOVIEW = '/photoview';
  static const SUBJECTACTIVITIES = '/subjectactivities';
  static const ACTIVITIES = '/activities';
  static const ASSIGNMENTACTIVITY = '/assignmentactivities';
  static const QUIZACTIVITY = '/quizactivity';
  static const NOTIFICATIONS = '/notifications';
  static const LIVEQUIZ = '/livequiz';
  static const INAPPNOTIFICATION = '/notification';
  static const MYREWARDSPAGE = '/rewards';
  static const MYREPORTSPAGE = '/reports';
  static const FORGOTPASSWORD = '/forgot';
  static const OTP = '/otp';
  static const UPDATEPASSWORD = '/updatepassword';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
      HOMESCREEN: (context) => const Home(),
      LOGIN: (context) => const Login(),
      REGISTER: (context) => const Register(),
      NAVIG: (context) => const Navig(),
      CHAPTERS: (context) => const Chapters(),
      CHAPTERCONTENT: (context) => const ChapterContent(),
      STORYVIEW: (context) => const StoryPage(),
      PHOTOVIEW: (context) => const ViewPhoto(),
      EXAMSASSIGNMENTS: (context) => const ExamsAndAssignments(),
      SLIDES: (context) => const Slides(),
      PDFVIEW: (context) => const PdfViewer(),
      CHAPTERTEST: (context) => const ChapterTest(),
      WRITEANSWER: (context) => const WriteAnswer(),
      SUBJECTACTIVITIES: (context) => const SubjectActivites(),
      ACTIVITIES: (context) => const Activities(),
      ASSIGNMENTACTIVITY: (context) => const AssignmentActivity(),
      QUIZACTIVITY: (context) => const QuizActivtiy(),
      NOTIFICATIONS: (context) => const Notifications(),
      LIVEQUIZ: (context) => const LiveQuiz(),
      //   INAPPNOTIFICATION: (context) => const Notifications(),
      FORGOTPASSWORD: (context) => const ForgotPassword(),
      OTP: (context) => const OtpPage(),
      UPDATEPASSWORD: (context) => const UpdatePassword(),
      // MYREWARDSPAGE: (context) => const MyRewards(),
      // MYREPORTSPAGE: (context) => const MyReports()
    };
    return appRoutes;
  }
}
