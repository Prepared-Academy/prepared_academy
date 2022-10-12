// To parse this JSON data, do
//
//     final RegisterModel = RegisterModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.grade,
    this.demoSchoolName,
    this.contactNo,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? grade;
  final String? demoSchoolName;
  final String? contactNo;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        grade: json["grade"],
        demoSchoolName: json["demoSchoolName"],
        contactNo: json["contactNo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "grade": grade,
        "demoSchoolName": demoSchoolName,
        "contactNo": contactNo,
      };
}
