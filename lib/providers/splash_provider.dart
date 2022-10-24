import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';

import '../models/user_model.dart';

class SplashProvider extends ChangeNotifier {
  UserModel userModel = UserModel();
  AuthRepo authRepo = AuthRepo();
  String token = "";

  Future init() async {
    final userJson = await authRepo.getUser();

    userJson.listen((event) {
      if (event != null) {
        userModel = userModelFromJson(event);
        token = userModel.accessToken ?? "";
        notifyListeners();
      }
    });
    await await Future.delayed(const Duration(seconds: 3));
    if (token != "") {
      OneContext().pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
    } else {
      OneContext().pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
    }
  }
}
