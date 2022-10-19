import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/models/inclass_subjects_model.dart';
import 'package:prepared_academy/models/subject_activity_model.dart';
import 'package:prepared_academy/repository/class_acitvity_repo.dart';
import 'package:prepared_academy/utils/helper.dart';

class ClassActivityProvider extends ChangeNotifier {
  bool isLoading = true;
  final ClassActivityRepo classActivityRepo = ClassActivityRepo();

  List<InClassSubjectsModel> inClassSubjects = [];
  List<SubjectActivityModel> subjectActivities = [];
  List<ActivityModel> activities = [];

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

  Future getSubjectActivities(int subjectId) async {
    try {
      loadingShow();
      Response apiResponse =
          await classActivityRepo.getSubjectActivities(subjectId);
      if (apiResponse.statusCode == 200) {
        subjectActivities =
            subjectActivityModelFromJson(jsonEncode(apiResponse.data));

        // Show data by latest date
        subjectActivities.sort((a, b) => b.publishDate!.millisecondsSinceEpoch
            .compareTo(a.publishDate!.millisecondsSinceEpoch));

        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future getActivities(int activityId) async {
    try {
      loadingShow();
      Response apiResponse = await classActivityRepo.getActivities(activityId);
      if (apiResponse.statusCode == 200) {
        activities = activityModelFromJson(jsonEncode(apiResponse.data));

        // Show data by latest date
        // subjectActivities.sort((a, b) => b.publishDate!.millisecondsSinceEpoch
        //     .compareTo(a.publishDate!.millisecondsSinceEpoch));

        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
