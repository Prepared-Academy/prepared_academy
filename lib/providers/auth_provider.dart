import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/login_model.dart';
import 'package:prepared_academy/models/user_model.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:prepared_academy/services/splash_services.dart';
import 'package:prepared_academy/utils/shared_preference.dart';
import '../models/register_model.dart';
import '../routes/router.dart';
import '../services/notification_services.dart';
import '../setup.dart';
import '../utils/helper.dart';
import '../utils/snackbar.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = true;
  final locator = getIt.get<SharedPreferencesHelper>();
  final AuthRepo authRepo = AuthRepo();
  UserModel userModel = UserModel();
  String email = "";

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future login(LoginModel loginModel) async {
    try {
      loading(true);
      String dataJson = loginModelToJson(loginModel);
      Response apiResponse = await authRepo.login(dataJson);
      if (apiResponse.statusCode == 200) {
        userModel = UserModel.fromJson(apiResponse.data);
        if (userModel.message!.contains("Resend verification link in")) {
          NotificationsService.showSnackbar(userModel.message!);
        } else if (userModel.message!
            .contains("Verification link sent to your mail")) {
          NotificationsService.showSnackbar(userModel.message!);
        } else if (apiResponse.data["message"] == "Login Successful") {
          if (userModel.user!.role == 0) {
            await authRepo.saveUser(userModel);
            await authRepo.creatLoginTime(userModel.user!.id!);
            NotificationServices.saveFirebaseToken(userModel.user!.id!);
            OneContext()
                .pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
          } else {
            NotificationsService.showSnackbar(
                apiResponse.data["Invalid credential"]);
          }
        }
      }

      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future register(RegisterModel registerModel) async {
    try {
      loading(true);
      String dataJson = registerModelToJson(registerModel);
      Response apiResponse = await authRepo.register(dataJson);

      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Email already registered") {
          NotificationsService.showSnackbar(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Verification link sent") {
          OneContext()
              .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
          successRegister();
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future sendOTP(String email) async {
    this.email = email;
    var data = {"email": email};
    try {
      loading(true);
      Response apiResponse = await authRepo.forgotsentOTP(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "User not found!!") {
          NotificationsService.showErrorToast(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Email sent Successfully!") {
          OneContext().pushNamed(AppRoutes.OTP);
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future reSendOTP() async {
    var data = {"email": email};
    try {
      loading(true);
      Response apiResponse = await authRepo.forgotsentOTP(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "User not found!!") {
          NotificationsService.showErrorToast(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Email sent Successfully!") {
          NotificationsService.showToast(apiResponse.data["message"]);
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future verifyOTP(String otp) async {
    debugPrint(otp.toString());
    var data = {"email": email, "otp": otp};
    try {
      loading(true);
      Response apiResponse = await authRepo.verifyOTP(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Incorrect OTP") {
          NotificationsService.showErrorToast(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "OTP Verified") {
          OneContext().pushNamedAndRemoveUntil(
              AppRoutes.UPDATEPASSWORD, (route) => false);
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future updatePassword(String password) async {
    var data = {"email": email, "password": password};
    try {
      loading(true);
      Response apiResponse = await authRepo.updatePassword(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Password Changed Successfully") {
          NotificationsService.showToast("Password Changed Successfully");
          OneContext()
              .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  void logout() {
    authRepo.updateLogoutTime(SplashServices.userId);
    locator.removeAll();
    OneContext().pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
  }
}
