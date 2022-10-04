import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

// // remove all screens

void customPushAndRemoveUntill(String route) {
  OneContext().pushNamedAndRemoveUntil(route, (route) => false);
}

void customPushAndRemoveUntillWithArgument(String route, Object? arguments) {
  OneContext()
      .pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
}

// // push screen

customPush(String route) {
  OneContext().pushNamed(route);
}

void customPushWithArgument(String route, Object? arguments) {
  OneContext().pushNamed(route, arguments: arguments);
}

// pop screen
// void popScreen() {
//   Navigator.pop(Navigate.navigatorKey.currentState!.context);
// }
