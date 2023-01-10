import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:prepared_academy/models/notifications_model.dart';
import 'package:prepared_academy/repository/notification_repo.dart';

class NotificationProvider extends ChangeNotifier {
  bool isLoading = true;
  final NotificationRepo notificationRepo = NotificationRepo();
  List<GetNotificationModel> getNotificationModel = [];

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getNotifications() async {
    try {
      loading(true);
      Response apiResponse = await notificationRepo.getNotifications();
      if (apiResponse.statusCode == 200) {
        NotificationsModel notificationsModel =
            notificationsModelFromJson(jsonEncode(apiResponse.data));
        getNotificationModel = notificationsModel.notifications ?? [];

        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }
}
