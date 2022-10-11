import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/routes/router.dart';

class SplashProvider extends ChangeNotifier {
  Future init() async {
    await Future.delayed(const Duration(seconds: 3));
    OneContext().pushNamedAndRemoveUntil(AppRoutes.REGISTER, (route) => false);
  }
}
