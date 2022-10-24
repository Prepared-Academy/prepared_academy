// To parse this JSON data, do
//
//     final getAssignmentActivityModel = getAssignmentActivityModelFromJson(jsonString);

import 'dart:convert';

GetAssignmentActivityModel getAssignmentActivityModelFromJson(String str) =>
    GetAssignmentActivityModel.fromJson(json.decode(str));

String getAssignmentActivityModelToJson(GetAssignmentActivityModel data) =>
    json.encode(data.toJson());

class GetAssignmentActivityModel {
  GetAssignmentActivityModel({
    this.studentAssignmentActivity,
  });

  final List<StudentAssignmentActivity>? studentAssignmentActivity;

  factory GetAssignmentActivityModel.fromJson(Map<String, dynamic> json) =>
      GetAssignmentActivityModel(
        studentAssignmentActivity: json["StudentAssignmentActivity"] == null
            ? null
            : List<StudentAssignmentActivity>.from(
                json["StudentAssignmentActivity"]
                    .map((x) => StudentAssignmentActivity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StudentAssignmentActivity": studentAssignmentActivity == null
            ? null
            : List<dynamic>.from(
                studentAssignmentActivity!.map((x) => x.toJson())),
      };
}

class StudentAssignmentActivity {
  StudentAssignmentActivity({
    this.id,
    this.question,
    this.title,
  });

  final int? id;
  final String? question;
  final String? title;

  factory StudentAssignmentActivity.fromJson(Map<String, dynamic> json) =>
      StudentAssignmentActivity(
        id: json["id"],
        question: json["question"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "title": title,
      };
}
