import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
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
);
