import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/login_model.dart';
import 'package:prepared_academy/models/user_model.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:prepared_academy/utils/shared_preference.dart';

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
      Response apiResponse = await authRepo.login(dataJson);
      if (apiResponse.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(apiResponse.data);
        if (userModel.message!.contains("Resend verification link in")) {
          loadingStop();
          NotificationsService.showSnackbar(userModel.message!);
        } else if (userModel.message!
            .contains("Verification link sent to your mail")) {
          loadingStop();
          NotificationsService.showSnackbar(userModel.message!);
        } else if (apiResponse.data["message"] == "Login Successful") {
          // await setupInit();
          await authRepo.saveUser(userModel);

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
              .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
          successRegister();
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  void logout() {
    removeAll();
    OneContext().pushNamedAndRemoveUntil(AppRoutes.REGISTER, (route) => false);
  }
}
