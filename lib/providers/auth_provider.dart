import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo = AuthRepo();

  login() async {
    try {
      Response apiResponse = await authRepo.login();
    } catch (e) {}
  }
}
