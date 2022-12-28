// To parse this JSON data, do
//
//     final getReportModel = getReportModelFromJson(jsonString);

import 'dart:convert';

List<GetReportModel> getReportModelFromJson(String str) =>
    List<GetReportModel>.from(
        json.decode(str).map((x) => GetReportModel.fromJson(x)));

String getReportModelToJson(List<GetReportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReportModel {
  GetReportModel({
    this.chapterId,
    this.chapterName,
    // this.subjectName,
    // this.category,
    this.moduleCount,
    this.totalQuizScore,
    this.totalScore,
    this.quiztrack,
    this.lastAttended,
    this.studentId,
    this.responseId,
    this.score,
    // this.assignmentType,
    this.gradeId,
    this.assignmentTitle,
    this.subjectId,
    this.evaluatedOn,
    // this.evaluatedBy,
  });

  final int? chapterId;
  final String? chapterName;
  // final SubjectName? subjectName;
  // final Category? category;
  final int? moduleCount;
  final int? totalQuizScore;
  final int? totalScore;
  final List<Quiztrack>? quiztrack;
  final int? lastAttended;
  final int? studentId;
  final int? responseId;
  final String? score;
  // final AssignmentType? assignmentType;
  final int? gradeId;
  final String? assignmentTitle;
  final int? subjectId;
  final DateTime? evaluatedOn;
  // final EvaluatedBy? evaluatedBy;

  factory GetReportModel.fromJson(Map<String, dynamic> json) => GetReportModel(
        chapterId: json["chapterId"],
        chapterName: json["chapterName"],
        // subjectName: subjectNameValues.map[json["subjectName"]],
        // category: categoryValues.map[json["category"]],
        moduleCount: json["moduleCount"],
        totalQuizScore: json["totalQuizScore"],
        totalScore: json["totalScore"],
        quiztrack: json["quiztrack"] == null
            ? null
            : List<Quiztrack>.from(
                json["quiztrack"].map((x) => Quiztrack.fromJson(x))),
        lastAttended: json["lastAttended"],
        studentId: json["studentId"],
        responseId: json["responseId"],
        score: json["score"],
        // assignmentType: json["assignmentType"] == null ? null : assignmentTypeValues.map[json["assignmentType"]],
        gradeId: json["gradeId"],
        assignmentTitle: json["assignmentTitle"],
        subjectId: json["subjectId"],
        evaluatedOn: json["evaluatedOn"] == null
            ? null
            : DateTime.parse(json["evaluatedOn"]),
        // evaluatedBy: json["evaluatedBy"] == null ? null : evaluatedByValues.map[json["evaluatedBy"]],
      );

  Map<String, dynamic> toJson() => {
        "chapterId": chapterId,
        "chapterName": chapterName,
        // "subjectName": subjectNameValues.reverse[subjectName],
        // "category": categoryValues.reverse[category],
        "moduleCount": moduleCount,
        "totalQuizScore": totalQuizScore,
        "totalScore": totalScore,
        "quiztrack": quiztrack == null
            ? null
            : List<dynamic>.from(quiztrack!.map((x) => x.toJson())),
        "lastAttended": lastAttended,
        "studentId": studentId,
        "responseId": responseId,
        "score": score,
        // "assignmentType": assignmentType == null ? null : assignmentTypeValues.reverse[assignmentType],
        "gradeId": gradeId,
        "assignmentTitle": assignmentTitle,
        "subjectId": subjectId,
        "evaluatedOn":
            evaluatedOn == null ? null : evaluatedOn!.toIso8601String(),
        // "evaluatedBy": evaluatedBy == null ? null : evaluatedByValues.reverse[evaluatedBy],
      };
}

// enum AssignmentType { CUSTOM, GENERAL }

// final assignmentTypeValues = EnumValues({
//     "Custom": AssignmentType.CUSTOM,
//     "General": AssignmentType.GENERAL
// });

// enum Category { QUIZ, ASSIGNMENT }

// final categoryValues = EnumValues({
//     "assignment": Category.ASSIGNMENT,
//     "quiz": Category.QUIZ
// });

// enum EvaluatedBy { LAKSHMY_SASIDHARAN, ANJANA_ANIL }

// final evaluatedByValues = EnumValues({
//     "Anjana Anil": EvaluatedBy.ANJANA_ANIL,
//     "LAKSHMY SASIDHARAN": EvaluatedBy.LAKSHMY_SASIDHARAN
// });

class Quiztrack {
  Quiztrack({
    this.quizScore,
    this.chapterId,
    // this.subjectName,
    this.objectiveId,
    this.objectiveName,
  });

  final int? quizScore;
  final int? chapterId;
  // final SubjectName? subjectName;
  final int? objectiveId;
  final String? objectiveName;

  factory Quiztrack.fromJson(Map<String, dynamic> json) => Quiztrack(
        quizScore: json["quizScore"],
        chapterId: json["chapterId"],
        // subjectName: subjectNameValues.map[json["subjectName"]],
        objectiveId: json["objectiveId"],
        objectiveName: json["objectiveName"],
      );

  Map<String, dynamic> toJson() => {
        "quizScore": quizScore,
        "chapterId": chapterId,
        // "subjectName": subjectNameValues.reverse[subjectName],
        "objectiveId": objectiveId,
        "objectiveName": objectiveName,
      };
}

// enum SubjectName { CHEMISTRY, BIOLOGY, PHYSICS }

// final subjectNameValues = EnumValues({
//     "BIOLOGY": SubjectName.BIOLOGY,
//     "CHEMISTRY": SubjectName.CHEMISTRY,
//     "PHYSICS": SubjectName.PHYSICS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
