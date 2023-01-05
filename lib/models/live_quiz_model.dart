// To parse this JSON data, do
//
//     final liveQuizModel = liveQuizModelFromJson(jsonString);

import 'dart:convert';

List<LiveQuizModel> liveQuizModelFromJson(String str) =>
    List<LiveQuizModel>.from(
        json.decode(str).map((x) => LiveQuizModel.fromJson(x)));

String liveQuizModelToJson(List<LiveQuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiveQuizModel {
  LiveQuizModel({
    this.id,
    this.quizname,
    this.quizCode,
    this.quizDuration,
    this.subjectName,
    this.mentorName,
    this.submitStatus,
  });

  final int? id;
  final String? quizname;
  final String? quizCode;
  final String? quizDuration;
  final String? subjectName;
  final String? mentorName;
  final int? submitStatus;

  factory LiveQuizModel.fromJson(Map<String, dynamic> json) => LiveQuizModel(
        id: json["id"],
        quizname: json["quizname"],
        quizCode: json["quizCode"],
        quizDuration: json["quizDuration"],
        subjectName: json["subjectName"],
        mentorName: json["mentorName"],
        submitStatus: json["submitStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quizname": quizname,
        "quizCode": quizCode,
        "quizDuration": quizDuration,
        "subjectName": subjectName,
        "mentorName": mentorName,
        "submitStatus": submitStatus,
      };
}
