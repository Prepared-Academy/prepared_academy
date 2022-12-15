// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) =>
    List<ActivityModel>.from(
        json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  ActivityModel({
    required this.publishDate,
    required this.id,
    required this.category,
    required this.assignmentQuestion,
    required this.title,
    required this.typeId,
    required this.sequence,
    required this.activityDayMapId,
    required this.visibility,
    required this.status,
    required this.activityId,
    required this.score,
    required this.submitStatus,
    required this.activityDate,
    required this.totalM,
    required this.testDuration,
    required this.chapters,
    required this.chapterName,
    required this.videos,
    required this.libraries,
  });

  final DateTime? publishDate;
  final int? id;
  final String? category;
  final String? assignmentQuestion;
  final String? title;
  final int? typeId;
  final int? sequence;
  final int? activityDayMapId;
  final int? visibility;
  final int? status;
  final int? activityId;
  final dynamic? score;
  final bool? submitStatus;
  final DateTime? activityDate;
  final String? totalM;
  final int? testDuration;
  final List<Chapter>? chapters;
  final String? chapterName;
  final List<Video>? videos;
  final List<Library>? libraries;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        publishDate: json["publishDate"] == null
            ? null
            : DateTime.parse(json["publishDate"]),
        id: json["id"],
        category: json["category"],
        assignmentQuestion: json["assignmentQuestion"],
        title: json["title"],
        typeId: json["typeId"],
        sequence: json["sequence"],
        activityDayMapId: json["activityDayMapId"],
        visibility: json["visibility"],
        status: json["status"],
        activityId: json["activityId"],
        score: json["score"],
        submitStatus: json["submitStatus"],
        activityDate: json["activityDate"] == null
            ? null
            : DateTime.parse(json["activityDate"]),
        totalM: json["TotalM"],
        testDuration: json["testDuration"],
        chapters: json["chapters"] == null
            ? null
            : List<Chapter>.from(
                json["chapters"].map((x) => Chapter.fromJson(x))),
        chapterName: json["chapterName"],
        videos: json["videos"] == null
            ? null
            : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        libraries: json["libraries"] == null
            ? null
            : List<Library>.from(
                json["libraries"].map((x) => Library.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "publishDate":
            publishDate == null ? null : publishDate!.toIso8601String(),
        "id": id,
        "category": category,
        "assignmentQuestion": assignmentQuestion,
        "title": title,
        "typeId": typeId,
        "sequence": sequence,
        "activityDayMapId": activityDayMapId,
        "visibility": visibility,
        "status": status,
        "activityId": activityId,
        "score": score,
        "submitStatus": submitStatus,
        "activityDate":
            activityDate == null ? null : activityDate!.toIso8601String(),
        "TotalM": totalM,
        "testDuration": testDuration,
        "chapters": chapters == null
            ? null
            : List<dynamic>.from(chapters!.map((x) => x.toJson())),
        "chapterName": chapterName,
        "videos": videos == null
            ? null
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "libraries": libraries == null
            ? null
            : List<dynamic>.from(libraries!.map((x) => x.toJson())),
      };
}

class Chapter {
  Chapter({
    required this.id,
    required this.chapterId,
    required this.category,
    required this.chapterName,
  });

  final int? id;
  final int? chapterId;
  final String? category;
  final String? chapterName;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        chapterId: json["chapterId"],
        category: json["category"],
        chapterName: json["chapterName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapterId": chapterId,
        "category": category,
        "chapterName": chapterName,
      };
}

class Library {
  Library({
    required this.id,
    required this.subtitle,
    required this.description,
    required this.librarytype,
    required this.link,
    required this.videoThumbnail,
  });

  final int? id;
  final String? subtitle;
  final String? description;
  final String? librarytype;
  final String? link;
  final String? videoThumbnail;

  factory Library.fromJson(Map<String, dynamic> json) => Library(
        id: json["id"],
        subtitle: json["Subtitle"],
        description: json["description"],
        librarytype: json["librarytype"],
        link: json["link"],
        videoThumbnail: json["videoThumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Subtitle": subtitle,
        "description": description,
        "librarytype": librarytype,
        "link": link,
        "videoThumbnail": videoThumbnail,
      };
}

class Video {
  Video({
    required this.id,
    required this.objectiveVideoId,
    required this.objectiveId,
    required this.title,
    required this.description,
    required this.objImage,
    required this.objvideo,
    required this.score,
  });

  final int? id;
  final int? objectiveVideoId;
  final int? objectiveId;
  final String? title;
  final String? description;
  final String? objImage;
  final String? objvideo;
  final dynamic? score;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        objectiveVideoId: json["objectiveVideoId"],
        objectiveId: json["objectiveId"],
        title: json["title"],
        description: json["description"],
        objImage: json["objImage"],
        objvideo: json["objvideo"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "objectiveVideoId": objectiveVideoId,
        "objectiveId": objectiveId,
        "title": title,
        "description": description,
        "objImage": objImage,
        "objvideo": objvideo,
        "score": score,
      };
}
