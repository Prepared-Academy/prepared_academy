// To parse this JSON data, do
//
//     final inClassSubjectsModel = inClassSubjectsModelFromJson(jsonString);

import 'dart:convert';

List<InClassSubjectsModel> inClassSubjectsModelFromJson(String str) =>
    List<InClassSubjectsModel>.from(
        json.decode(str).map((x) => InClassSubjectsModel.fromJson(x)));

String inClassSubjectsModelToJson(List<InClassSubjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InClassSubjectsModel {
  InClassSubjectsModel({
    this.studentId,
    this.groupId,
    this.batchId,
    this.activityId,
    this.publishDate,
    this.subjectId,
    this.name,
    this.image1,
  });

  final int? studentId;
  final int? groupId;
  final int? batchId;
  final int? activityId;
  final DateTime? publishDate;
  final int? subjectId;
  final String? name;
  final String? image1;

  factory InClassSubjectsModel.fromJson(Map<String, dynamic> json) =>
      InClassSubjectsModel(
        studentId: json["studentId"],
        groupId: json["groupId"],
        batchId: json["batchId"],
        activityId: json["activityId"],
        publishDate: json["publishDate"] == null
            ? null
            : DateTime.parse(json["publishDate"]),
        subjectId: json["subjectId"],
        name: json["name"],
        image1: json["image1"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "groupId": groupId,
        "batchId": batchId,
        "activityId": activityId,
        "publishDate":
            publishDate == null ? null : publishDate!.toIso8601String(),
        "subjectId": subjectId,
        "name": name,
        "image1": image1,
      };
}
