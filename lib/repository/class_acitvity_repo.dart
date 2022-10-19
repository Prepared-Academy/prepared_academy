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
}
