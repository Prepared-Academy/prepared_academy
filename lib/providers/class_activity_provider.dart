import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/inclass_subjects_model.dart';
import 'package:prepared_academy/repository/class_acitvity_repo.dart';
import 'package:prepared_academy/utils/helper.dart';

class ClassActivityProvider extends ChangeNotifier {
  bool isLoading = true;
  final ClassActivityRepo classActivityRepo = ClassActivityRepo();

  List<InClassSubjectsModel> inClassSubjects = [];

  Future getMyInClassSubjects() async {
    try {
      loadingShow();
      Response apiResponse = await classActivityRepo.getMyInClassSubjects();

      if (apiResponse.statusCode == 200) {
        inClassSubjects =
            inClassSubjectsModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();

      rethrow;
    }
  }
}
