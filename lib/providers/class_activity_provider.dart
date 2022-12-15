// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:stream_duration/stream_duration.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/models/get_assignment_activity_model.dart';
import 'package:prepared_academy/models/get_test_activity_model.dart';
import 'package:prepared_academy/models/inclass_subjects_model.dart';
import 'package:prepared_academy/models/quiz_activity_model.dart';
import 'package:prepared_academy/models/subject_activity_model.dart';
import 'package:prepared_academy/repository/class_acitvity_repo.dart';

class ClassActivityProvider extends ChangeNotifier {
  bool isLoading = true;
  final ClassActivityRepo classActivityRepo = ClassActivityRepo();

  List<InClassSubjectsModel> inClassSubjects = [];
  List<SubjectActivityModel> subjectActivities = [];
  List<ActivityModel> activities = [];
  List<StudentAssignmentActivity> studentsAssignmentActivity = [];
  List<QuizActivityModel> quizActivityList = [];

  List<Questiontype> questionTypeList = [];
  List<Testquestion> testQuestionList = [];

  // holding subjectId
  int subjectId = 0;

  // holding activityId to refresh Page
  int activityId = 0;

  // storing quiz answers data
  Map<String, dynamic> quizAnswers = {};
  int quizAnswersSelected = -1;

// holding Video quiz acitvity
  int objectiveId = -1;
  int objectiveVideoId = -1;

  // holding test activity id
  int testActivityId = -1;

  StreamDuration streamDuration = StreamDuration(
    const Duration(hours: 1, minutes: 30),
  );

  // storing test answers data
  Map<String, dynamic> testAnswers = {};
  int testAnswersSelected = -1;

  List<Tab> tabs = [
    // Tab(height: 35, text: 'Fill in the blanks'.toUpperCase()),
    // Tab(height: 35, text: 'Very short'.toUpperCase()),
    // Tab(height: 35, text: 'Short'.toUpperCase()),
    // Tab(height: 35, text: 'Short'.toUpperCase()),
    // Tab(height: 35, text: 'Short'.toUpperCase()),
    // Tab(height: 35, text: 'Short'.toUpperCase()),
    // Tab(height: 35, text: 'Long'.toUpperCase()),
  ];

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getMyInClassSubjects() async {
    try {
      loading(true);
      Response apiResponse = await classActivityRepo.getMyInClassSubjects();
      if (apiResponse.statusCode == 200) {
        inClassSubjects =
            inClassSubjectsModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getSubjectActivities() async {
    try {
      loading(true);

      Response apiResponse =
          await classActivityRepo.getSubjectActivities(subjectId);
      if (apiResponse.statusCode == 200) {
        subjectActivities =
            subjectActivityModelFromJson(jsonEncode(apiResponse.data));

        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getActivities() async {
    activities = [];
    try {
      loading(true);
      Response apiResponse = await classActivityRepo.getActivities(activityId);
      if (apiResponse.statusCode == 200) {
        activities = activityModelFromJson(jsonEncode(apiResponse.data));

        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getAssignment(int id) async {
    try {
      loading(true);
      Response apiResponse = await classActivityRepo.getAssignmentActivity(id);
      if (apiResponse.statusCode == 200) {
        GetAssignmentActivityModel getAssignmentActivityModel =
            GetAssignmentActivityModel.fromJson(apiResponse.data);
        studentsAssignmentActivity =
            getAssignmentActivityModel.studentAssignmentActivity!;
        notifyListeners();
      }

      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future activityAssignmentSubmit(
      BuildContext context, int assignmentId, String answer) async {
    var data = {"assignmentId": assignmentId, "answer": answer};

    try {
      loading(true);
      Response apiResponse =
          await classActivityRepo.activityAssignmentSubmit(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Data Added Successfully") {
          await getActivities();
          Navigator.of(context).pop();
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getChatperModuleQuiz() async {
    quizActivityList = [];
    quizAnswers = {};
    quizAnswersSelected = -1;
    try {
      loading(true);
      Response apiResponse =
          await classActivityRepo.getChatperModuleQuiz(objectiveId);
      if (apiResponse.statusCode == 200) {
        quizActivityList =
            quizActivityModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  addQuizAnswer(int index, int quizMapId, int questionId, int optionId) {
    if (quizAnswers.containsKey("quizsubmit[$index][questionId]")) {
      quizAnswers.update("quizsubmit[$index][optionId]", (value) => optionId);
    } else {
      if (quizAnswersSelected < 1) {
        int activityIndex =
            activities.indexWhere((element) => element.typeId == 3);
        int index = activities[activityIndex].videos!.indexWhere(
            (element) => element.objectiveVideoId == objectiveVideoId);

        Map<String, dynamic> map = {
          "activityVideoId": activities[activityIndex].videos![index].id,
          "objectiveVideoId": objectiveVideoId,
          // "quizlength": quizActivityList.length,
          // "videoId": activities[activityIndex].videos![index].id,
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
      loading(true);
      Response apiResponse =
          await classActivityRepo.activityVideoQuizSubmit(quizAnswers);
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["totalScore"] == 5) {
          await getActivities();
          OneContext().pop();
        }
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getTest() async {
    try {
      loading(true);
      Response apiResponse =
          await classActivityRepo.getTestActivity(testActivityId);
      if (apiResponse.statusCode == 200) {
        tabs = [];
        TestActivityModel testActivityModel =
            TestActivityModel.fromJson(apiResponse.data);
        questionTypeList = testActivityModel.questiontypes!;
        testQuestionList = testActivityModel.testquestion!;
        for (var i = 0; i < questionTypeList.length; i++) {
          tabs.add(Tab(height: 35, text: questionTypeList[i].questionType));
        }
        notifyListeners();
      }
      // await Future.delayed(const Duration(seconds: 1));
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  addTestAnswers(int index, int testMapId, int questionId, String answers) {
    if (testAnswers.containsKey("testsubmit[$index][questionId]")) {
      testAnswers.update("testsubmit[$index][answer]", (value) => answers);
    } else {
      if (testAnswersSelected < 1) {
        Map<String, dynamic> map = {
          "testmapId": testMapId,
        };
        testAnswers.addEntries(map.entries);
      }
      Map<String, dynamic> map = {
        "testsubmit[$index][questionId]": questionId,
        "testsubmit[$index][answer]": answers,
      };

      testAnswers.addEntries(map.entries);
      testAnswersSelected++;
    }

    notifyListeners();
  }

  Future activityTestSubmit() async {
    try {
      loading(true);
      Response apiResponse =
          await classActivityRepo.activityTestSubmit(testAnswers);
      if (apiResponse.statusCode == 200) {
        await getActivities();
        OneContext().pop();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }
}
