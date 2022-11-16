// To parse this JSON data, do
//
//     final inappNotificationModel = inappNotificationModelFromJson(jsonString);

import 'dart:convert';

InappNotificationModel inappNotificationModelFromJson(String str) =>
    InappNotificationModel.fromJson(json.decode(str));

String inappNotificationModelToJson(InappNotificationModel data) =>
    json.encode(data.toJson());

class InappNotificationModel {
  InappNotificationModel({
    this.notifications,
    this.count,
  });

  final List<Notification>? notifications;
  final int? count;

  factory InappNotificationModel.fromJson(Map<String, dynamic> json) =>
      InappNotificationModel(
        notifications: json["notifications"] == null
            ? null
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
        "count": count,
      };
}

class Notification {
  Notification({
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
  final DateTime? time;
  final String? action;
  final int? status;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        notificationId:
            json["notificationId"] == null ? null : json["notificationId"],
        message: json["message"] == null ? null : json["message"],
        notificationType:
            json["notificationType"] == null ? null : json["notificationType"],
        type: json["Type"] == null ? null : json["Type"],
        refId: json["refId"] == null ? null : json["refId"],
        time: DateTime.parse(json["time"]),
        action: json["action"] == null ? null : json["action"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "notificationId": notificationId == null ? null : notificationId,
        "message": message == null ? null : message,
        "notificationType": notificationType == null ? null : notificationType,
        "Type": type == null ? null : type,
        "refId": refId == null ? null : refId,
        "time": time!.toIso8601String() == null ? null : time,
        "action": action == null ? null : action,
        "status": status == null ? null : status,
      };
}
