import 'dart:convert';

import 'package:dio/dio.dart';

import '../repository/notification_repo.dart';

class NotificationServices {
  static NotificationRepo notificationRepo = NotificationRepo();

  static Future saveFirebaseToken(int userId) async {
    // final fcmToken = await FirebaseMessaging.instance.getToken();
    try {
      var data = {"userId": userId, "token": "sajoi3ueasd"};
      Response apiResponse =
          await notificationRepo.saveFirebaseToken(jsonEncode(data));
      if (apiResponse.statusCode == 200) {}
    } catch (e) {
      rethrow;
    }
  }
}
