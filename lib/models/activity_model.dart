// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) =>
    List<ActivityModel>.from(
        json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  ActivityModel({
    this.id,
    this.category,
    this.assignmentQuestion,
    this.title,
    this.typeId,
    this.sequence,
    this.activityDayMapId,
    this.visibility,
    this.status,
    this.submitStatus,
    this.chapterName,
    this.videos,
    this.libraries,
  });

  final int? id;
  final String? category;
  final String? assignmentQuestion;
  final String? title;
  final int? typeId;
  final int? sequence;
  final int? activityDayMapId;
  final int? visibility;
  final int? status;
  final bool? submitStatus;
  final String? chapterName;
  final List<Video>? videos;
  final List<Library>? libraries;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json["id"],
        category: json["category"],
        assignmentQuestion: json["assignmentQuestion"],
        title: json["title"],
        typeId: json["typeId"],
        sequence: json["sequence"],
        activityDayMapId: json["activityDayMapId"],
        visibility: json["visibility"],
        status: json["status"],
        submitStatus: json["submitStatus"],
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
        "id": id,
        "category": category,
        "assignmentQuestion": assignmentQuestion,
        "title": title,
        "typeId": typeId,
        "sequence": sequence,
        "activityDayMapId": activityDayMapId,
        "visibility": visibility,
        "status": status,
        "submitStatus": submitStatus,
        "chapterName": chapterName,
        "videos": videos == null
            ? null
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "libraries": libraries == null
            ? null
            : List<dynamic>.from(libraries!.map((x) => x.toJson())),
      };
}

class Library {
  Library({
    this.id,
    this.subtitle,
    this.description,
    this.librarytype,
    this.link,
  });

  final int? id;
  final String? subtitle;
  final String? description;
  final String? librarytype;
  final String? link;

  factory Library.fromJson(Map<String, dynamic> json) => Library(
        id: json["id"],
        subtitle: json["Subtitle"],
        description: json["description"],
        librarytype: json["librarytype"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Subtitle": subtitle,
        "description": description,
        "librarytype": librarytype,
        "link": link,
      };
}

class Video {
  Video({
    this.id,
    this.objectiveId,
    this.title,
    this.description,
    this.objImage,
    this.objvideo,
    this.score,
  });

  final int? id;
  final int? objectiveId;
  final String? title;
  final String? description;
  final String? objImage;
  final String? objvideo;
  final int? score;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        objectiveId: json["objectiveId"],
        title: json["title"],
        description: json["description"],
        objImage: json["objImage"],
        objvideo: json["objvideo"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "objectiveId": objectiveId,
        "title": title,
        "description": description,
        "objImage": objImage,
        "objvideo": objvideo,
        "score": score,
      };
}
