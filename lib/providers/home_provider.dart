import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/repository/home_repo.dart';

import '../utils/helper.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  final HomeRepo homeRepo = HomeRepo();

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getStory() async {
    try {
      loadingShow();

      Response apiResponse = await homeRepo.stories();

      // if (apiResponse.statusCode == 200) {
      //   UserModel userModel = UserModel.fromJson(apiResponse.data);
      //   if (userModel.message!.contains("Resend verification link in")) {
      //     loadingStop();
      //     NotificationsService.showSnackbar(userModel.message!);
      //   } else if (userModel.message!
      //       .contains("Verification link sent to your mail")) {
      //     loadingStop();
      //     NotificationsService.showSnackbar(userModel.message!);
      //   } else if (apiResponse.data["message"] == "Login Successful") {
      //     await authRepo.saveUser(userModel);
      //     loadingStop();
      //     OneContext()
      //         .pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
      //   }
      // }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
