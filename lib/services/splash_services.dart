// ignore_for_file: use_build_context_synchronously

import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/repository/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/services/notification_services.dart';
import 'package:prepared_academy/services/user_service.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import '../models/user_model.dart';
import '../setup.dart';
import '../utils/shared_preference.dart';

class SplashServices {
  static SharedPreferencesHelper locator = getIt.get<SharedPreferencesHelper>();
  static UserModel userModel = UserModel();
  static AuthRepo authRepo = AuthRepo();
  static String token = "";
  static int userId = -1;

  static Future init() async {
    final userJson = await locator.getStringValue(AppConstants.USER);
    if (userJson != "") {
      userModel = userModelFromJson(userJson);
      token = userModel.accessToken ?? "";
      userId = userModel.user!.id ?? -1;
      await UserService.updateToken(token);
      debugPrint("User Token: ${UserService.token}");
    }
    // await await Future.delayed(const Duration(seconds: 3));
    if (token != "") {
      await NotificationServices.saveFirebaseToken(userId);
      OneContext().pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
    } else {
      OneContext().pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
    }
    // checkForUpdate();
  }

  static Future<void> checkForUpdate() async {
    await AppVersionUpdate.checkForUpdates().then((data) async {
      if (data.canUpdate!) {
        AppVersionUpdate.showAlertUpdate(
          mandatory: true,
          appVersionResult: data,
          context: OneContext().context,
        );
      }
    });
  }
}
