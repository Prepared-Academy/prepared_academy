// To parse this JSON data, do
//
//     final subjectActivityModel = subjectActivityModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<SubjectActivityModel> subjectActivityModelFromJson(String str) =>
    List<SubjectActivityModel>.from(
        json.decode(str).map((x) => SubjectActivityModel.fromJson(x)));

String subjectActivityModelToJson(List<SubjectActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectActivityModel {
  SubjectActivityModel({
    this.groupId,
    this.activityName,
    this.activityId,
    this.days,
    this.publishDate,
    this.name,
    this.subjectImage,
    this.gradeId,
    this.groupName,
    this.types,
  });

  final int? groupId;
  final String? activityName;
  final int? activityId;
  final int? days;
  final DateTime? publishDate;
  final String? name;
  final String? subjectImage;
  final int? gradeId;
  final String? groupName;
  final List<Type>? types;

  factory SubjectActivityModel.fromJson(Map<String, dynamic> json) =>
      SubjectActivityModel(
        groupId: json["groupId"],
        activityName: json["activityName"],
        activityId: json["activityId"],
        days: json["days"],
        publishDate: json["publishDate"] == null
            ? null
            : DateTime.parse(json["publishDate"]),
        name: json["name"] == null ? null : null,
        subjectImage: json["subjectImage"],
        gradeId: json["gradeId"],
        groupName: json["groupName"],
        types: json["types"] == null
            ? null
            : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "activityName": activityName,
        "activityId": activityId,
        "days": days,
        "publishDate":
            publishDate == null ? null : publishDate!.toIso8601String(),
        "name": name,
        "subjectImage": subjectImage,
        "gradeId": gradeId,
        "groupName": groupName,
        "types": types == null
            ? null
            : List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class Type {
  Type({
    this.id,
    this.typeName,
    this.activityImage,
    this.activityId,
  });

  final int? id;
  final String? typeName;
  final String? activityImage;
  final int? activityId;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        typeName: json["typeName"],
        activityImage: json["activityImage"],
        activityId: json["activityId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
        "activityImage": activityImage,
        "activityId": activityId,
      };
}
