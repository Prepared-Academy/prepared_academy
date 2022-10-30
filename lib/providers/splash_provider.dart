import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../models/user_model.dart';
import '../setup.dart';
import '../utils/shared_preference.dart';

class SplashProvider extends ChangeNotifier {
  final locator = getIt.get<SharedPreferencesHelper>();
  UserModel userModel = UserModel();
  AuthRepo authRepo = AuthRepo();
  String token = "";

  Future init() async {
    final userJson = await locator.getStringValue(AppConstants.USER);
    if (userJson != null) {
      userModel = userModelFromJson(userJson);
      token = userModel.accessToken ?? "";
      notifyListeners();
    }
    await await Future.delayed(const Duration(seconds: 3));
    if (token != "") {
      OneContext().pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
    } else {
      OneContext().pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
    }
  }
}
