import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:prepared_academy/models/inapp_notification.dart';
import 'package:prepared_academy/repository/inappnotification_repo.dart';
import 'package:prepared_academy/utils/helper.dart';

class InAppNotificationProvider extends ChangeNotifier {
  InappNotificationModel inappNotificationModel = InappNotificationModel();

  Future getInappNotifications() async {
    try {
      loadingShow();
      Response apiResponse =
          await InAppNotificationRepo().getInAppNotifications();
      if (apiResponse.statusCode == 200) {
        inappNotificationModel =
            inappNotificationModelToJson((apiResponse.data))
                as InappNotificationModel;
        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
