import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade100,
  splashFactory: InkRipple.splashFactory,

  // useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 0.5,
    backgroundColor: Colors.grey.shade100,
    foregroundColor: Colors.black,
    titleTextStyle: const TextStyle(
      color: kBlack,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),

  // input decoration
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    isCollapsed: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kBlue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kPrimaryColor, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kBorder),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
    // hintStyle: const TextStyle(
    //   color: kgrey,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 13,
    // ),
    labelStyle: const TextStyle(
      color: kgrey,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),

    floatingLabelStyle: const TextStyle(
      color: kBlue,
      fontWeight: FontWeight.normal,
      fontSize: 13,
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
