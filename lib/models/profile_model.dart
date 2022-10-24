// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.name,
    this.email,
    this.schoolName,
    this.profileImage,
    this.dob,
    this.grade,
    this.xp,
    this.subjectsCount,
    this.totalCompletion,
    this.mentors,
    this.avatharLevel,
  });

  String? name;
  String? email;
  String? schoolName;
  String? profileImage;
  dynamic dob;
  dynamic grade;
  int? xp;
  int? subjectsCount;
  String? totalCompletion;
  List<dynamic>? mentors;
  List<dynamic>? avatharLevel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        schoolName: json["schoolName"],
        profileImage: json["profileImage"],
        dob: json["dob"],
        grade: json["grade"],
        xp: json["xp"],
        subjectsCount: json["subjectsCount"],
        totalCompletion: json["TotalCompletion"],
        mentors: List<dynamic>.from(json["mentors"].map((x) => x)),
        avatharLevel: List<dynamic>.from(json["avatharLevel"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "schoolName": schoolName,
        "profileImage": profileImage,
        "dob": dob,
        "grade": grade,
        "xp": xp,
        "subjectsCount": subjectsCount,
        "TotalCompletion": totalCompletion,
        "mentors": List<dynamic>.from(mentors!.map((x) => x)),
        "avatharLevel": List<dynamic>.from(avatharLevel!.map((x) => x)),
      };
}
