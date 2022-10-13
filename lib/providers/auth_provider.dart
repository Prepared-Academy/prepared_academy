import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/helpers/helper.dart';
import 'package:prepared_academy/models/userModel.dart';
import 'package:prepared_academy/repos/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/utils/snackbar.dart';

import '../data/dio/dio_client.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo = AuthRepo();

  var client = GetIt.I<DioClient>();

  setState() {
    notifyListeners();
  }

  Future login(LoginModel loginModel) async {
    try {
      loadingShow();
      String dataJson = loginModelToJson(loginModel);
      Response apiResponse = await authRepo.login(dataJson);
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Resend verification link in 22s") {
          loadingStop();
          NotificationsService.showSnackbar(apiResponse.data["message"]);
        } else if (apiResponse.data["message"] == "Login Successful") {
          loadingStop();
          OneContext()
              .pushNamedAndRemoveUntil(AppRoutes.PROFILE, (route) => false);
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
