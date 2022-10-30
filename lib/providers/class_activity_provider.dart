// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/models/get_assignment_activity_model.dart';
import 'package:prepared_academy/models/inclass_subjects_model.dart';
import 'package:prepared_academy/models/quiz_activity_model.dart';
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
  List<QuizActivityModel> quizActivityList = [];

  // holding activityId to refresh Page
  int activityId = 0;

  // storing quiz answers data
  Map<String, dynamic> quizAnswers = {};
  int quizAnswersSelected = -1;

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

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
    activities = [];
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

  Future getChatperModuleQuiz(int objectiveId) async {
    quizActivityList = [];
    quizAnswers = {};
    quizAnswersSelected = -1;
    try {
      loadingShow();
      Response apiResponse =
          await classActivityRepo.getChatperModuleQuiz(objectiveId);
      if (apiResponse.statusCode == 200) {
        quizActivityList =
            quizActivityModelFromJson(jsonEncode(apiResponse.data));

        notifyListeners();
      }
      loadingStop();
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  addQuizAnswer(
      int objectiveId, int index, int quizMapId, int questionId, int optionId) {
    if (quizAnswers.containsKey("quizsubmit[$index][questionId]")) {
      quizAnswers.update("quizsubmit[$index][optionId]", (value) => optionId);
    } else {
      if (quizAnswersSelected < 1) {
        int activityIndex =
            activities.indexWhere((element) => element.typeId == 3);
        int index = activities[activityIndex]
            .videos!
            .indexWhere((element) => element.objectiveId == objectiveId);

        Map<String, dynamic> map = {
          "activityVideoId": activities[activityIndex].videos![index].id,
          "objectiveId": objectiveId,
          "quizlength": quizActivityList.length,
          "videoId": activities[activityIndex].videos![index].id,
        };
        quizAnswers.addEntries(map.entries);
      }
      Map<String, dynamic> map = {
        "quizsubmit[$index][quizmapId]": quizMapId,
        "quizsubmit[$index][questionId]": questionId,
        "quizsubmit[$index][optionId]": optionId,
      };

      quizAnswers.addEntries(map.entries);
      quizAnswersSelected++;
    }

    notifyListeners();
  }

  Future activityVideoQuizSubmit() async {
    try {
      loadingShow();
      Response apiResponse =
          await classActivityRepo.activityVideoQuizSubmit(quizAnswers);
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["totalScore"] == 5) {
          await getActivities(activityId);
          OneContext().pop();
          loadingStop();
        }
      }
    } catch (e) {
      loadingStop();
      rethrow;
    }
  }

  Future<bool> unlockActivityUpdate(int sequence) async {
    bool isLocked = false;
    var data = {"activityId": activityId, "sequence": sequence};

    try {
      Response apiResponse =
          await classActivityRepo.unlockActivityUpdate(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["locked"] == true) {
          isLocked = true;
        } else {
          isLocked = false;
        }
      }

      return isLocked;
    } catch (e) {
      rethrow;
    }
  }
}
