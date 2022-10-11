// To parse this JSON data, do
//
//     final UserModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  var data;

  UserModel({
    this.message = "",
    required this.user,
    required this.accessToken,
  });

  final String? message;
  final User? user;
  final String? accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.contactno,
    required this.schoolName,
    required this.grade,
    required this.nationality,
    required this.profileImage,
    required this.coverImage,
    required this.status,
    required this.visibility,
    required this.dob,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.demoschoolName,
    required this.schoolId,
    required this.imei,
    required this.stamp1,
    required this.stamp2,
    required this.androidToken,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  int role;
  dynamic contactno;
  String schoolName;
  int grade;
  dynamic nationality;
  String profileImage;
  String coverImage;
  dynamic status;
  dynamic visibility;
  dynamic dob;
  dynamic value1;
  dynamic value2;
  dynamic value3;
  dynamic demoschoolName;
  dynamic schoolId;
  dynamic imei;
  dynamic stamp1;
  dynamic stamp2;
  dynamic androidToken;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: json["firstName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "firstName": firstName,
      };
}
