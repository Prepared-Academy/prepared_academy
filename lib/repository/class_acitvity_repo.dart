import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class ClassActivityRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> getMyInClassSubjects() async {
    try {
      final Response response =
          await client.get(AppConstants.INCLASS_SUBJECTS_URI);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getSubjectActivities(int subjectId) async {
    try {
      final Response response =
          await client.get("${AppConstants.SUBJECT_ACTIVITY_URI}/$subjectId");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getActivities(int activityId) async {
    try {
      final Response response =
          await client.get("${AppConstants.ACITVITIES_URI}/$activityId");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getAssignmentActivity(int id) async {
    try {
      final Response response =
          await client.get("${AppConstants.GET_ASSIGNMENT_ACTIVITY_URI}/$id");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> activityAssignmentSubmit(String data) async {
    try {
      final Response response = await client
          .post(AppConstants.ACTIVITY_ASSIGNMENT_SUBMIT_URI, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getTestActivity(int testmapId) async {
    try {
      final Response response =
          await client.get("${AppConstants.GET_TEST_ACTIVITY_URI}/$testmapId");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
