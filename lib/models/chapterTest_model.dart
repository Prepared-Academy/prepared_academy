// To parse this JSON data, do
//
//     final ChapterTestModel = ChapterTestModelFromJson(jsonString);

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
        testquestion: List<Testquestion>.from(
            json["testquestion"].map((x) => Testquestion.fromJson(x))),
        questiontypes: List<Questiontype>.from(
            json["questiontypes"].map((x) => Questiontype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "testquestion":
            List<dynamic>.from(testquestion!.map((x) => x.toJson())),
        "questiontypes":
            List<dynamic>.from(questiontypes!.map((x) => x.toJson())),
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

  int? taxonomyCount;
  int? id;
  String? questionType;
  int? numberOfQuestions;
  int? sequence;

  factory Questiontype.fromJson(Map<String, dynamic> json) => Questiontype(
        taxonomyCount: json["taxonomyCount"],
        id: json["id"],
        questionType: json["questionType"],
        numberOfQuestions: json["NumberOfQuestions"],
        sequence: json["Sequence"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomyCount": taxonomyCount,
        "id": id,
        "questionType": questionType,
        "NumberOfQuestions": numberOfQuestions,
        "Sequence": sequence,
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
    // this.difficulty,
    // this.chapterName,
    this.questionType,
    this.qmarks,
    this.sequence,
  });

  int? questionId;
  int? taxonomyId;
  int? testDuration;
  int? testmapId;
  int? typeId;
  String? question;
  // Difficulty? difficulty;
  // ChapterName? chapterName;
  String? questionType;
  int? qmarks;
  int? sequence;

  factory Testquestion.fromJson(Map<String, dynamic> json) => Testquestion(
        questionId: json["questionId"],
        taxonomyId: json["taxonomyId"],
        testDuration: json["testDuration"],
        testmapId: json["testmapId"],
        typeId: json["typeId"],
        question: json["question"],
        // difficulty: difficultyValues.map[json["difficulty"]],
        // chapterName: chapterNameValues.map[json["chapterName"]],
        questionType: json["questionType"],
        qmarks: json["Qmarks"],
        sequence: json["Sequence"],
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "taxonomyId": taxonomyId,
        "testDuration": testDuration,
        "testmapId": testmapId,
        "typeId": typeId,
        "question": question,
        // "difficulty": difficultyValues.reverse[difficulty],
        // "chapterName": chapterNameValues.reverse[chapterName],
        "questionType": questionType,
        "Qmarks": qmarks,
        "Sequence": sequence,
      };
}

// enum ChapterName { NUTRITION_IN_ANIMALS }

// final chapterNameValues =
//     EnumValues({"Nutrition in Animals": ChapterName.NUTRITION_IN_ANIMALS});

// enum Difficulty { LOW, MEDIUM, HARD }

// final difficultyValues = EnumValues({
//   "HARD": Difficulty.HARD,
//   "LOW": Difficulty.LOW,
//   "MEDIUM": Difficulty.MEDIUM
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
