import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/login_model.dart';
import 'package:prepared_academy/repository/auth_repo.dart';

import '../models/register_model.dart';
import '../routes/router.dart';
import '../utils/helper.dart';
import '../utils/snackbar.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = true;
  final AuthRepo authRepo = AuthRepo();

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future login(LoginModel loginModel) async {
    try {
      loadingShow();
      String dataJson = loginModelToJson(loginModel);
      Response apiResponse = await authRepo.register(dataJson);
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Resend verification link in 22s") {
          loadingStop();
          NotificationsService.showSnackbar(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Login Successful") {
          loadingStop();
          OneContext()
              .pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future register(RegisterModel registerModel) async {
    try {
      loadingShow();
      String dataJson = registerModelToJson(registerModel);
      Response apiResponse = await authRepo.register(dataJson);

      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Email already registered") {
          loadingStop();
          NotificationsService.showSnackbar(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Verification link sent") {
          loadingStop();
          OneContext()
              .pushNamedAndRemoveUntil(AppRoutes.REGISTER, (route) => false);
          successRegister();
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
