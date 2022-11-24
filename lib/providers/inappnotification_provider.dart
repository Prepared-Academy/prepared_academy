import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:prepared_academy/models/inapp_notification.dart';
import 'package:prepared_academy/repository/inappnotification_repo.dart';
import 'package:prepared_academy/utils/helper.dart';

class InAppNotificationProvider extends ChangeNotifier {
  InAppNotificationRepo inAppNotificationRepo = InAppNotificationRepo();
  InappNotificationModel inappNotificationModel = InappNotificationModel();

  Future getInappNotifications() async {
    try {
      loadingShow();
      Response apiResponse =
          await inAppNotificationRepo.getInAppNotifications();
      if (apiResponse.statusCode == 200) {
        inappNotificationModel =
            InappNotificationModel.fromJson(apiResponse.data);
        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
