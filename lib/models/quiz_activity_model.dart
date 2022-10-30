// To parse this JSON data, do
//
//     final quizActivityModel = quizActivityModelFromJson(jsonString);

import 'dart:convert';

List<QuizActivityModel> quizActivityModelFromJson(String str) =>
    List<QuizActivityModel>.from(
        json.decode(str).map((x) => QuizActivityModel.fromJson(x)));

String quizActivityModelToJson(List<QuizActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizActivityModel {
  QuizActivityModel({
    this.questionId,
    this.status,
    this.quizmapId,
    this.question,
    this.taxonomyId,
    this.taxonomyType,
    this.options,
  });

  final int? questionId;
  final int? status;
  final int? quizmapId;
  final String? question;
  final int? taxonomyId;
  final String? taxonomyType;
  final List<Option>? options;

  factory QuizActivityModel.fromJson(Map<String, dynamic> json) =>
      QuizActivityModel(
        questionId: json["questionId"],
        status: json["status"],
        quizmapId: json["quizmapId"],
        question: json["question"],
        taxonomyId: json["taxonomyId"],
        taxonomyType: json["taxonomyType"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "status": status,
        "quizmapId": quizmapId,
        "question": question,
        "taxonomyId": taxonomyId,
        "taxonomyType": taxonomyType,
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.optionsId,
    this.questionId,
    this.options,
  });

  final int? optionsId;
  final int? questionId;
  final String? options;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionsId: json["optionsId"],
        questionId: json["questionId"],
        options: json["options"],
      );

  Map<String, dynamic> toJson() => {
        "optionsId": optionsId,
        "questionId": questionId,
        "options": options,
      };
}
