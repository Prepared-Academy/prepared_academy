import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/repository/live_quiz_repo.dart';

import '../models/live_quiz_model.dart';

class LiveQuizProvider extends ChangeNotifier {
  bool isLoading = true;
  LiveQuizRepo liveQuizRepo = LiveQuizRepo();

  List<LiveQuizModel> liveQuizesList = [];

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future init() async {
    try {
      loading(true);
      await getLiveQuizes();

      loading(false);
    } catch (e) {
      loading(false);
    }
  }

  Future getLiveQuizes() async {
    try {
      Response apiResponse = await liveQuizRepo.getLiveQuizes();

      if (apiResponse.statusCode == 200) {
        liveQuizesList = liveQuizModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
