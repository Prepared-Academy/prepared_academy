// To parse this JSON data, do
//
//     final testActivityModel = testActivityModelFromJson(jsonString);

import 'dart:convert';

TestActivityModel testActivityModelFromJson(String str) =>
    TestActivityModel.fromJson(json.decode(str));

String testActivityModelToJson(TestActivityModel data) =>
    json.encode(data.toJson());

class TestActivityModel {
  TestActivityModel({this.testquestion, this.questiontypes});

  final List<Testquestion>? testquestion;
  final List<Questiontype>? questiontypes;

  factory TestActivityModel.fromJson(Map<String, dynamic> json) =>
      TestActivityModel(
        testquestion: json["testquestion"] == null
            ? null
            : List<Testquestion>.from(
                json["testquestion"].map((x) => Testquestion.fromJson(x))),
        questiontypes: json["questiontypes"] == null
            ? null
            : List<Questiontype>.from(
                json["questiontypes"].map((x) => Questiontype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "testquestion": testquestion == null
            ? null
            : List<dynamic>.from(testquestion!.map((x) => x.toJson())),
        "questiontypes": questiontypes == null
            ? null
            : List<dynamic>.from(questiontypes!.map((x) => x.toJson())),
      };
}

class Questiontype {
  Questiontype({
    required this.taxonomyCount,
    required this.id,
    required this.questionType,
    required this.numberOfQuestions,
    required this.sequence,
  });

  final int? taxonomyCount;
  final int? id;
  final String? questionType;
  final int? numberOfQuestions;
  final int? sequence;

  factory Questiontype.fromJson(Map<String, dynamic> json) => Questiontype(
        taxonomyCount: json["taxonomyCount"],
        id: json["id"],
        questionType: json["questionType"],
        numberOfQuestions: json["NumberOfQuestions"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomyCount": taxonomyCount,
        "id": id,
        "questionType": questionType,
        "NumberOfQuestions": numberOfQuestions,
        "sequence": sequence,
      };
}

class Testquestion {
  Testquestion({
    required this.questionId,
    required this.taxonomyId,
    required this.testDuration,
    required this.testmapId,
    required this.typeId,
    required this.question,
    required this.difficulty,
    required this.questionType,
    required this.qmarks,
    required this.sequence,
  });

  final int? questionId;
  final int? taxonomyId;
  final int? testDuration;
  final int? testmapId;
  final int? typeId;
  final String? question;
  final String? difficulty;
  final String? questionType;
  final int? qmarks;
  final int? sequence;

  factory Testquestion.fromJson(Map<String, dynamic> json) => Testquestion(
        questionId: json["questionId"],
        taxonomyId: json["taxonomyId"],
        testDuration: json["testDuration"],
        testmapId: json["testmapId"],
        typeId: json["typeId"],
        question: json["question"],
        difficulty: json["difficulty"],
        questionType: json["questionType"],
        qmarks: json["Qmarks"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "taxonomyId": taxonomyId,
        "testDuration": testDuration,
        "testmapId": testmapId,
        "typeId": typeId,
        "question": question,
        "difficulty": difficulty,
        "questionType": questionType,
        "Qmarks": qmarks,
        "sequence": sequence,
      };
}
