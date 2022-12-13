// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.email,
    this.password,
    this.message,
    this.code,
  });

  final String? email;
  final String? password;
  final String? message;
  final int? code;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "message": message,
        "code": code,
      };
}
