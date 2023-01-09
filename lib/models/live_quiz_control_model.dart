// To parse this JSON data, do
//
//     final liveQuizControlModel = liveQuizControlModelFromJson(jsonString);

import 'dart:convert';

LiveQuizControlModel liveQuizControlModelFromJson(String str) =>
    LiveQuizControlModel.fromJson(json.decode(str));

String liveQuizControlModelToJson(LiveQuizControlModel? data) =>
    json.encode(data!.toJson());

class LiveQuizControlModel {
  LiveQuizControlModel({
    this.quizCode,
    this.playMode,
    this.action,
  });

  final String? quizCode;
  final String? playMode;
  final String? action;

  factory LiveQuizControlModel.fromJson(Map<String, dynamic> json) =>
      LiveQuizControlModel(
        quizCode: json["quizCode"],
        playMode: json["playMode"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "quizCode": quizCode,
        "playMode": playMode,
        "action": action,
      };
}
