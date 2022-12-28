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

  final String? name;
  final String? email;
  final String? schoolName;
  final String? profileImage;
  final String? dob;
  final int? grade;
  final int? xp;
  final int? subjectsCount;
  final String? totalCompletion;
  final List<Mentor>? mentors;
  final List<dynamic>? avatharLevel;

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
        mentors: json["mentors"] =
            List<Mentor>.from(json["mentors"].map((x) => Mentor.fromJson(x))),
        avatharLevel: json["avatharLevel"] == null
            ? null
            : List<dynamic>.from(json["avatharLevel"].map((x) => x)),
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
        "mentors": mentors!.isEmpty
            ? null
            : List<dynamic>.from(mentors!.map((x) => x.toJson())),
        "avatharLevel": avatharLevel == null
            ? null
            : List<dynamic>.from(avatharLevel!.map((x) => x)),
      };
}

class Mentor {
  Mentor({
    required this.id,
    required this.batchId,
    required this.studentId,
    required this.subjectId,
    required this.mentorId,
    required this.name,
    required this.profileImage,
    required this.sname,
  });

  final int? id;
  final int? batchId;
  final int? studentId;
  final int? subjectId;
  final int? mentorId;
  final String? name;
  final String? profileImage;
  final String? sname;

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
        id: json["id"],
        batchId: json["batchId"],
        studentId: json["studentId"],
        subjectId: json["subjectId"],
        mentorId: json["mentorId"],
        name: json["name"],
        profileImage: json["profileImage"],
        sname: json["sname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batchId": batchId,
        "studentId": studentId,
        "subjectId": subjectId,
        "mentorId": mentorId,
        "name": name,
        "profileImage": profileImage,
        "sname": sname,
      };
}
