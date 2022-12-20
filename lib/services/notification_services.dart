import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../repository/notification_repo.dart';

class NotificationServices {
  static NotificationRepo notificationRepo = NotificationRepo();

  static Future saveFirebaseToken(int userId) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN: $fcmToken");
    try {
      var data = {"userId": userId, "token": fcmToken};
      Response apiResponse =
          await notificationRepo.saveFirebaseToken(jsonEncode(data));
      if (apiResponse.statusCode == 200) {}
    } catch (e) {
      rethrow;
    }
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

// bool isFlutterLocalNotificationsInitialized = false;

Future requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted provisional permission');
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

Future<void> setupFlutterNotifications() async {
  channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      enableLights: true,
      enableVibration: true);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestPermission();

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification() {
  // FirebaseMessaging.onMessage.listen((message) {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null && !kIsWeb) {
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           channelDescription: channel.description,
  //           //      one that already exists in example app.
  //           icon: 'launch_background',
  //         ),
  //       ),
  //     );
  //   }
  // });

  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<String> getToken() async {
  String? token = "";
  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    debugPrint('FlutterFire Messaging Example: Getting APNs token...');
    // token = await FirebaseMessaging.instance.getAPNSToken();
    token = await FirebaseMessaging.instance.getToken();
    debugPrint('FlutterFire Messaging Example: Got APNs token: $token');
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    token = await FirebaseMessaging.instance.getToken();
  } else {
    debugPrint(
      'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
    );
  }
  return token ?? "";
}

void _handleMessage(RemoteMessage message) {
  debugPrint("Noti Data: ${message.data["id"]}");
  debugPrint("Noti Data: ${message.data}");
  debugPrint("Noti Data: ${message.data["body"]}");
  // if (message.data['screen'] == 'chat') {
  //   OneContext().pushNamed(AppRoutes.NAVIG);
  // }
}
