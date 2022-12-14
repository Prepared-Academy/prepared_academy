// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:prepared_academy/views/app/bookmark.dart';
import 'package:prepared_academy/views/app/contact.dart';
import 'package:prepared_academy/views/app/feedback.dart';
import 'package:prepared_academy/views/app/mycourses.dart';
import 'package:prepared_academy/views/app/notifications.dart';
import 'package:prepared_academy/views/app/profile.dart';
import 'package:prepared_academy/views/app/profile/pass_reset.dart';
import 'package:prepared_academy/views/app/report_main.dart';
import 'package:prepared_academy/views/app/rewards.dart';
import 'package:prepared_academy/views/auth/login.dart';
import 'package:prepared_academy/views/auth/register.dart';
import 'package:prepared_academy/views/mycourses/datascience.dart';
import 'package:prepared_academy/views/mycourses/programmer.dart';
import 'package:prepared_academy/views/mycourses/robotics.dart';

import '../views/auth/splash.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const PROFILE = "/profile";
  static const PASSRESET = "/passreset";
  static const NOTIFICATIONS = "/notifications";
  static const BOOKMARK = "/bookmark";
  static const FEEDBACK = "/feedback";
  static const CONTACTUS = "/contactus";
  static const REPORTMAIN = "/reportmain";
  static const REWARDS = "/rewards";
  static const MYCOURSES = "/mycourses";
  static const DATASCIENCE = "/datascience";
  static const PROGRAMMER = "/programmer";
  static const ROBOTICS = "/robotics";

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      SPLASHSCREEN: (context) => const Splash(),
      LOGIN: (context) => const Login(),
      REGISTER: (context) => const Register(),
      PROFILE: (context) => const Profile(),
      PASSRESET: (context) => const PasswordReset(),
      NOTIFICATIONS: (context) => const Notifications(),
      BOOKMARK: (context) => const Bookmark(),
      FEEDBACK: (context) => const FeedBack(),
      CONTACTUS: (context) => const ContactUs(),
      REPORTMAIN: (context) => const ReportMain(),
      REWARDS: (context) => const Rewards(),
      MYCOURSES: (context) => const MyCourses(),
      DATASCIENCE: (context) => const DataScience(),
      PROGRAMMER: (context) => const Programmer(),
      ROBOTICS: (context) => const Robotics(),
    };
    return appRoutes;
  }
}
