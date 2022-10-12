import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  splashFactory: InkRipple.splashFactory,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.grey.shade50,
    foregroundColor: Colors.black,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  // input decoration
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    isCollapsed: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF707070)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF707070)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.red.shade600, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF707070)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.red.shade600, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  ),

  // cursor color
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: kPrimaryColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
  ),
);
