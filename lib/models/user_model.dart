// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.message,
    this.user,
    this.accessToken,
  });

  final String? message;
  final User? user;
  final String? accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user == null ? null : user!.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.contactno,
    this.schoolName,
    this.grade,
    this.nationality,
    this.profileImage,
    this.coverImage,
    this.status,
    this.visibility,
    this.dob,
    this.value1,
    this.value2,
    this.value3,
    this.demoschoolName,
    this.schoolId,
    this.imei,
    this.stamp1,
    this.stamp2,
    this.androidToken,
    this.createdAt,
    this.updatedAt,
    this.firstName,
  });

  final int? id;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final int? role;
  final dynamic? contactno;
  final String? schoolName;
  final int? grade;
  final dynamic? nationality;
  final String? profileImage;
  final String? coverImage;
  final dynamic? status;
  final dynamic? visibility;
  final dynamic? dob;
  final dynamic? value1;
  final dynamic? value2;
  final dynamic? value3;
  final dynamic? demoschoolName;
  final dynamic? schoolId;
  final dynamic? imei;
  final dynamic? stamp1;
  final dynamic? stamp2;
  final dynamic? androidToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        role: json["role"],
        contactno: json["contactno"],
        schoolName: json["schoolName"],
        grade: json["grade"],
        nationality: json["nationality"],
        profileImage: json["profileImage"],
        coverImage: json["coverImage"],
        status: json["status"],
        visibility: json["visibility"],
        dob: json["dob"],
        value1: json["value1"],
        value2: json["value2"],
        value3: json["value3"],
        demoschoolName: json["demoschoolName"],
        schoolId: json["schoolId"],
        imei: json["IMEI"],
        stamp1: json["stamp1"],
        stamp2: json["stamp2"],
        androidToken: json["android_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
        "role": role,
        "contactno": contactno,
        "schoolName": schoolName,
        "grade": grade,
        "nationality": nationality,
        "profileImage": profileImage,
        "coverImage": coverImage,
        "status": status,
        "visibility": visibility,
        "dob": dob,
        "value1": value1,
        "value2": value2,
        "value3": value3,
        "demoschoolName": demoschoolName,
        "schoolId": schoolId,
        "IMEI": imei,
        "stamp1": stamp1,
        "stamp2": stamp2,
        "android_token": androidToken,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "firstName": firstName,
      };
}
