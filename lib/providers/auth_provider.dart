import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/login_model.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:quickalert/quickalert.dart';

import '../models/register_model.dart';
import '../routes/router.dart';
import '../utils/helper.dart';

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
        OneContext().pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
        successRegister();
      }
    } catch (e) {
      rethrow;
    } finally {
      loadingStop();
    }
  }

  Future register(RegisterModel registerModel) async {
    try {
      loadingShow();
      String dataJson = registerModelToJson(registerModel);
      Response apiResponse = await authRepo.register(dataJson);
      if (apiResponse.statusCode == 200) {
        OneContext()
            .pushNamedAndRemoveUntil(AppRoutes.REGISTER, (route) => false);
        successRegister();
      }
    } catch (e) {
      rethrow;
    } finally {
      loadingStop();
    }
  }

  void successRegister() {
    QuickAlert.show(
      context: dialogContext,
      type: QuickAlertType.success,
      text: 'Your account is created successfully/',
    );
  }
}
