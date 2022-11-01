// To parse this JSON data, do
//
//     final chapterTestModel = chapterTestModelFromJson(jsonString);

import 'dart:convert';

ChapterTestModel chapterTestModelFromJson(String str) =>
    ChapterTestModel.fromJson(json.decode(str));

String chapterTestModelToJson(ChapterTestModel data) =>
    json.encode(data.toJson());

class ChapterTestModel {
  ChapterTestModel({
    this.testquestion,
    this.questiontypes,
  });

  final List<Testquestion>? testquestion;
  final List<Questiontype>? questiontypes;

  factory ChapterTestModel.fromJson(Map<String, dynamic> json) =>
      ChapterTestModel(
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
    this.taxonomyCount,
    this.id,
    this.questionType,
    this.numberOfQuestions,
    this.sequence,
  });

  final int? taxonomyCount;
  final int? id;
  final String? questionType;
  final int? numberOfQuestions;
  final int? sequence;

  factory Questiontype.fromJson(Map<String, dynamic> json) => Questiontype(
        taxonomyCount:
            json["taxonomyCount"] == null ? null : json["taxonomyCount"],
        id: json["id"] == null ? null : json["id"],
        questionType:
            json["questionType"] == null ? null : json["questionType"],
        numberOfQuestions: json["NumberOfQuestions"] == null
            ? null
            : json["NumberOfQuestions"],
        sequence: json["Sequence"] == null ? null : json["Sequence"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomyCount": taxonomyCount == null ? null : taxonomyCount,
        "id": id == null ? null : id,
        "questionType": questionType == null ? null : questionType,
        "NumberOfQuestions":
            numberOfQuestions == null ? null : numberOfQuestions,
        "Sequence": sequence == null ? null : sequence,
      };
}

class Testquestion {
  Testquestion({
    this.questionId,
    this.taxonomyId,
    this.testDuration,
    this.testmapId,
    this.typeId,
    this.question,
    this.difficulty,
    this.chapterName,
    this.questionType,
    this.qmarks,
    this.sequence,
  });

  final int? questionId;
  final int? taxonomyId;
  final int? testDuration;
  final int? testmapId;
  final int? typeId;
  final String? question;
  final String? difficulty;
  final String? chapterName;
  final String? questionType;
  final int? qmarks;
  final int? sequence;

  factory Testquestion.fromJson(Map<String, dynamic> json) => Testquestion(
        questionId: json["questionId"] == null ? null : json["questionId"],
        taxonomyId: json["taxonomyId"] == null ? null : json["taxonomyId"],
        testDuration:
            json["testDuration"] == null ? null : json["testDuration"],
        testmapId: json["testmapId"] == null ? null : json["testmapId"],
        typeId: json["typeId"] == null ? null : json["typeId"],
        question: json["question"] == null ? null : json["question"],
        difficulty: json["difficulty"] == null ? null : json["difficulty"],
        chapterName: json["chapterName"] == null ? null : json["difficulty"],
        questionType:
            json["questionType"] == null ? null : json["questionType"],
        qmarks: json["Qmarks"] == null ? null : json["Qmarks"],
        sequence: json["Sequence"] == null ? null : json["Sequence"],
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId == null ? null : questionId,
        "taxonomyId": taxonomyId == null ? null : taxonomyId,
        "testDuration": testDuration == null ? null : testDuration,
        "testmapId": testmapId == null ? null : testmapId,
        "typeId": typeId == null ? null : typeId,
        "question": question == null ? null : question,
        "difficulty": difficulty == null ? null : difficulty,
        "chapterName": chapterName == null ? null : difficulty,
        "questionType": questionType == null ? null : questionType,
        "Qmarks": qmarks == null ? null : qmarks,
        "Sequence": sequence == null ? null : sequence,
      };
}
