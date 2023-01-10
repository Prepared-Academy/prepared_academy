// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel? data) =>
    json.encode(data!.toJson());

class NotificationsModel {
  NotificationsModel({
    this.notifications,
    this.count,
  });

  final List<GetNotificationModel>? notifications;
  final int? count;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        notifications: json["notifications"] == null
            ? []
            : json["notifications"] == null
                ? []
                : List<GetNotificationModel>.from(json["notifications"]!
                    .map((x) => GetNotificationModel.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? []
            : notifications == null
                ? []
                : List<dynamic>.from(notifications!.map((x) => x.toJson())),
        "count": count,
      };
}

class GetNotificationModel {
  GetNotificationModel({
    this.notificationId,
    this.message,
    this.notificationType,
    this.type,
    this.refId,
    this.time,
    this.action,
    this.status,
  });

  final int? notificationId;
  final String? message;
  final int? notificationType;
  final int? type;
  final int? refId;
  final String? time;
  final String? action;
  final int? status;

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationModel(
        notificationId: json["notificationId"],
        message: json["message"],
        notificationType: json["notificationType"],
        type: json["Type"],
        refId: json["refId"],
        time: json["time"],
        action: json["action"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "notificationId": notificationId,
        "message": message,
        "notificationType": notificationType,
        "Type": type,
        "refId": refId,
        "time": time,
        "action": action,
        "status": status,
      };
}
