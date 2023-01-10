import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class LiveQuizRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> getLiveQuizes() async {
    try {
      final Response response =
          await client.get(AppConstants.GET_LIVE_QUIZ_URI);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getLiveQuizQuestions(String quizId) async {
    try {
      final Response response = await client
          .get("${AppConstants.GET_LIVE_QUIZ_QUESTION_URI}/$quizId");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}