// To parse this JSON data, do
//
//     final getStudentDashBoardModel = getStudentDashBoardModelFromJson(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

GetStudentDashBoardModel getStudentDashBoardModelFromJson(String str) =>
    GetStudentDashBoardModel.fromJson(json.decode(str));

String getStudentDashBoardModelToJson(GetStudentDashBoardModel data) =>
    json.encode(data.toJson());

class GetStudentDashBoardModel {
  GetStudentDashBoardModel({
    this.posts,
    this.recentlyLearned,
    this.suggestedVideo,
    this.imei,
  });

  final List<Post>? posts;
  final List<RecentlyLearned>? recentlyLearned;
  final List<SuggestedVideo>? suggestedVideo;
  final String? imei;

  factory GetStudentDashBoardModel.fromJson(Map<String, dynamic> json) =>
      GetStudentDashBoardModel(
        posts: json["posts"] == null
            ? null
            : List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        recentlyLearned: json["recentlyLearned"] == null
            ? null
            : List<RecentlyLearned>.from(json["recentlyLearned"]
                .map((x) => RecentlyLearned.fromJson(x))),
        suggestedVideo: json["suggestedVideo"] == null
            ? null
            : List<SuggestedVideo>.from(
                json["suggestedVideo"].map((x) => SuggestedVideo.fromJson(x))),
        imei: json["IMEI"],
      );

  Map<String, dynamic> toJson() => {
        "posts": posts == null
            ? null
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "recentlyLearned": recentlyLearned == null
            ? null
            : List<dynamic>.from(recentlyLearned!.map((x) => x.toJson())),
        "suggestedVideo": suggestedVideo == null
            ? null
            : List<dynamic>.from(suggestedVideo!.map((x) => x.toJson())),
        "IMEI": imei,
      };
}

class Post {
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.attachment1,
    required this.attachment2,
    required this.attachment3,
    required this.description,
    required this.likes,
    required this.share,
    required this.valInt1,
    required this.valInt2,
    required this.valStr1,
    required this.valStr2,
    required this.createdAt,
    required this.updatedAt,
    required this.visibility,
    required this.userName,
    required this.profileImage,
    required this.role,
    required this.likeStatus,
  });

  final int? id;
  final int? userId;
  final String? title;
  final String? subtitle;
  final String? category;
  final String? attachment1;
  final String? attachment2;
  final String? attachment3;
  final String? description;
  final int? likes;
  final dynamic? share;
  final dynamic? valInt1;
  final dynamic? valInt2;
  final dynamic? valStr1;
  final dynamic? valStr2;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? visibility;
  final String? userName;
  final String? profileImage;
  final int? role;
  final int? likeStatus;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        category: json["category"],
        attachment1: json["attachment1"],
        attachment2: json["attachment2"],
        attachment3: json["attachment3"],
        description: json["description"],
        likes: json["likes"],
        share: json["share"],
        valInt1: json["valInt1"],
        valInt2: json["valInt2"],
        valStr1: json["valStr1"],
        valStr2: json["valStr2"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        visibility: json["visibility"],
        userName: json["userName"],
        profileImage: json["profileImage"],
        role: json["role"],
        likeStatus: json["likeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        "category": category,
        "attachment1": attachment1,
        "attachment2": attachment2,
        "attachment3": attachment3,
        "description": description,
        "likes": likes,
        "share": share,
        "valInt1": valInt1,
        "valInt2": valInt2,
        "valStr1": valStr1,
        "valStr2": valStr2,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "visibility": visibility,
        "userName": userName,
        "profileImage": profileImage,
        "role": role,
        "likeStatus": likeStatus,
      };
}

class RecentlyLearned {
  RecentlyLearned({
    required this.id,
    required this.studentId,
    required this.videoId,
    required this.objectiveId,
    required this.title,
    required this.description,
    required this.objectiveImage,
    required this.chapterId,
    required this.chapterName,
    required this.subjectName,
    required this.quizattend,
    required this.bookmarkStatus,
    required this.bookmarkId,
    required this.typeId,
    required this.chapterCompleted,
  });

  final int? id;
  final int? studentId;
  final int? videoId;
  final int? objectiveId;
  final String? title;
  final String? description;
  final String? objectiveImage;
  final int? chapterId;
  final String? chapterName;
  final String? subjectName;
  final int? quizattend;
  final int? bookmarkStatus;
  final int? bookmarkId;
  final int? typeId;
  final int? chapterCompleted;

  factory RecentlyLearned.fromJson(Map<String, dynamic> json) =>
      RecentlyLearned(
        id: json["id"],
        studentId: json["studentId"],
        videoId: json["videoId"],
        objectiveId: json["objectiveId"],
        title: json["title"],
        description: json["description"],
        objectiveImage: json["objectiveImage"],
        chapterId: json["chapterId"],
        chapterName: json["chapterName"],
        subjectName: json["subjectName"],
        quizattend: json["quizattend"],
        bookmarkStatus: json["bookmarkStatus"],
        bookmarkId: json["bookmarkId"],
        typeId: json["typeId"],
        chapterCompleted: json["chapterCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentId": studentId,
        "videoId": videoId,
        "objectiveId": objectiveId,
        "title": title,
        "description": description,
        "objectiveImage": objectiveImage,
        "chapterId": chapterId,
        "chapterName": chapterName,
        "subjectName": subjectName,
        "quizattend": quizattend,
        "bookmarkStatus": bookmarkStatus,
        "bookmarkId": bookmarkId,
        "typeId": typeId,
        "chapterCompleted": chapterCompleted,
      };
}

class SuggestedVideo {
  SuggestedVideo({
    required this.objectiveId,
    required this.name,
    required this.id,
    required this.chapterId,
    required this.title,
    required this.objvideoLink,
    required this.objImage,
    required this.description,
  });

  final int? objectiveId;
  final String? name;
  final int? id;
  final int? chapterId;
  final String? title;
  final String? objvideoLink;
  final String? objImage;
  final String? description;

  factory SuggestedVideo.fromJson(Map<String, dynamic> json) => SuggestedVideo(
        objectiveId: json["objectiveId"],
        name: json["name"],
        id: json["id"],
        chapterId: json["chapterId"],
        title: json["title"],
        objvideoLink: json["objvideoLink"],
        objImage: json["objImage"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "objectiveId": objectiveId,
        "name": name,
        "id": id,
        "chapterId": chapterId,
        "title": title,
        "objvideoLink": objvideoLink,
        "objImage": objImage,
        "description": description,
      };
}
