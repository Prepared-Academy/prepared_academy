// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/models/get_assignment_activity_model.dart';
import 'package:prepared_academy/models/chapter_test_model.dart';
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
  List<StudentAssignmentActivity> studentsAssignmentActivity = [];
  ChapterTestModel chapterTestquizList = ChapterTestModel();

  // holding activityId to refresh Page
  int activityId = 0;

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getMyInClassSubjects() async {
    try {
      loadingShow();
      Response apiResponse = await classActivityRepo.getMyInClassSubjects();
      if (apiResponse.statusCode == 200) {
        print("aayittind");
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

        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future getAssignment(int id) async {
    try {
      loadingShow();
      Response apiResponse = await classActivityRepo.getAssignmentActivity(id);
      if (apiResponse.statusCode == 200) {
        GetAssignmentActivityModel getAssignmentActivityModel =
            GetAssignmentActivityModel.fromJson(apiResponse.data);
        studentsAssignmentActivity =
            getAssignmentActivityModel.studentAssignmentActivity!;
        notifyListeners();
      }
      await Future.delayed(const Duration(seconds: 1));

      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future activityAssignmentSubmit(
      BuildContext context, int assignmentId, String answer) async {
    var data = {"assignmentId": assignmentId, "answer": answer};

    try {
      loadingShow();
      Response apiResponse =
          await classActivityRepo.activityAssignmentSubmit(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Data Added Successfully") {
          loadingStop();
          await getActivities(activityId);
          Navigator.pop(context);
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future getTestActivity(int testmapId) async {
    chapterTestquizList = ChapterTestModel();
    try {
      loadingShow();
      Response apiResponse = await classActivityRepo.getTestActivity(testmapId);
      if (apiResponse.statusCode == 200) {
        chapterTestquizList =
            chapterTestModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }
}
