import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prepared_academy/data/dio/api_response.dart';
import 'package:prepared_academy/models/userModel.dart';
import 'package:prepared_academy/repos/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/navigates.dart';
import 'package:prepared_academy/utils/shared_preferences.dart';
import 'package:prepared_academy/utils/snackbar.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo = AuthRepo();
  final bool _isLoading = false;
  UserModel userModel = UserModel(accessToken: '', user: null);

  bool get isLoading => _isLoading;

  setState() {
    notifyListeners();
  }

  Future login(String email, String password) async {
    Map data = {"email": email, "password": password};
    try {
      EasyLoading.show(status: 'loading...');
      ApiResponse apiResponse = await authRepo.login(data);

      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        userModel = UserModel.fromJson(apiResponse.response!.data);
        String user = jsonEncode(userModel);

        setStringValue(AppConstants.USER, user);
        saveUser(userModel.data!.token!, userModel.data!.user!.name!,
            userModel.data!.user!.email!, userModel.data!.user!.clinics!);

        customPushAndRemoveUntill(AppRoutes.PROFILE);
        debugPrint("Token: ${userModel.data!.token!}");
        debugPrint('Login successfully....');
        NotificationsService.showSnackbar('Login successfully');
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void saveUser(String token, String name, String email, int clinicId) {
    setStringValue(AppConstants.TOKEN, token);
    setStringValue(AppConstants.NAME, name);
    setStringValue(AppConstants.USER_EMAIL, email);
  }
}
