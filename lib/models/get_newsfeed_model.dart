// To parse this JSON data, do
//
//     final getNewsFeedModel = getNewsFeedModelFromJson(jsonString);

import 'dart:convert';

List<GetNewsFeedModel> getNewsFeedModelFromJson(String str) =>
    List<GetNewsFeedModel>.from(
        json.decode(str).map((x) => GetNewsFeedModel.fromJson(x)));

String getNewsFeedModelToJson(List<GetNewsFeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNewsFeedModel {
  GetNewsFeedModel({
    this.posts,
    this.recentlyLearned,
    this.suggestedVideo,
    this.imei,
  });

  final List<Post>? posts;
  final List<RecentlyLearned>? recentlyLearned;
  final List<SuggestedVideo>? suggestedVideo;
  final String? imei;

  factory GetNewsFeedModel.fromJson(Map<String, dynamic> json) =>
      GetNewsFeedModel(
        posts: json["posts"] == null
            ? null
            : List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        recentlyLearned: List<RecentlyLearned>.from(
            json["recentlyLearned"].map((x) => RecentlyLearned.fromJson(x))),
        suggestedVideo: List<SuggestedVideo>.from(
            json["suggestedVideo"].map((x) => SuggestedVideo.fromJson(x))),
        imei: json["IMEI"],
      );

  Map<String, dynamic> toJson() => {
        "posts": posts == null
            ? null
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "recentlyLearned":
            List<dynamic>.from(recentlyLearned!.map((x) => x.toJson())),
        "suggestedVideo":
            List<dynamic>.from(suggestedVideo!.map((x) => x.toJson())),
        "IMEI": imei,
      };
}

class Post {
  Post({
    this.id,
    this.userId,
    this.title,
    this.subtitle,
    // this.category,
    this.attachment1,
    this.attachment2,
    this.attachment3,
    this.description,
    this.likes,
    this.share,
    this.valInt1,
    this.valInt2,
    this.valStr1,
    this.valStr2,
    this.createdAt,
    this.updatedAt,
    this.visibility,
    // this.userName,
    // this.profileImage,
    this.role,
    this.likeStatus,
  });

  final int? id;
  final int? userId;
  final String? title;
  final String? subtitle;
  // final Category? category;
  final String? attachment1;
  final dynamic attachment2;
  final dynamic attachment3;
  final String? description;
  final int? likes;
  final dynamic share;
  final dynamic valInt1;
  final dynamic valInt2;
  final dynamic valStr1;
  final dynamic valStr2;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? visibility;
  // final UserName? userName;
  // final ProfileImage? profileImage;
  final int? role;
  final int? likeStatus;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        subtitle: json["subtitle"],
        // category: categoryValues.map[json["category"]],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        visibility: json["visibility"],
        // userName: userNameValues.map[json["userName"]],
        // profileImage: profileImageValues.map[json["profileImage"]],
        role: json["role"],
        likeStatus: json["likeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "subtitle": subtitle,
        // "category": categoryValues.reverse[category],
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "visibility": visibility,
        // "userName": userNameValues.reverse[userName],
        // "profileImage": profileImageValues.reverse[profileImage],
        "role": role,
        "likeStatus": likeStatus,
      };
}

// enum Category { IMAGE }

// final categoryValues = EnumValues({"image": Category.IMAGE});

// enum ProfileImage {
//   THE_16214937911603625775_JPG,
//   THE_1603628261_PREPAREDPNG_01_PNG
// }

// final profileImageValues = EnumValues({
//   "1603628261_Preparedpng-01.png":
//       ProfileImage.THE_1603628261_PREPAREDPNG_01_PNG,
//   "1621493791_1603625775.jpg": ProfileImage.THE_16214937911603625775_JPG
// });

// enum UserName { AMAN, PREPAR_ED_ACADEMY }

// final userNameValues = EnumValues(
//     {"Aman": UserName.AMAN, "PreparEd Academy": UserName.PREPAR_ED_ACADEMY});

class RecentlyLearned {
  RecentlyLearned({
    this.id,
    this.studentId,
    this.videoId,
    this.objectiveId,
    this.title,
    this.description,
    this.objectiveImage,
    this.chapterId,
    this.chapterName,
    this.subjectName,
    this.quizattend,
    this.bookmarkStatus,
    this.bookmarkId,
    this.typeId,
    this.chapterCompleted,
  });

  int? id;
  int? videoId;
  int? studentId;
  int? title;
  int? objectiveId;
  String? description;
  String? objectiveImage;
  int? chapterId;
  String? chapterName;
  String? subjectName;
  int? quizattend;
  int? bookmarkStatus;
  int? bookmarkId;
  int? typeId;
  int? chapterCompleted;

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
    this.objectiveId,
    this.name,
    this.id,
    this.chapterId,
    this.title,
    this.objvideoLink,
    this.objImage,
    this.description,
  });

  int? objectiveId;
  String? name;
  int? id;
  int? chapterId;
  String? title;
  String? objvideoLink;
  String? objImage;
  String? description;

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

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap;
//     return reverseMap;
//   }
// }
