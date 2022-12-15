import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class HomeRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> stories() async {
    try {
      final Response response = await client.get(AppConstants.STORY_URI);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> addBookMarkStory(String data) async {
    try {
      final Response response =
          await client.post(AppConstants.BOOKMARKSTORY_URI, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> removeBookmarkStory(String data) async {
    try {
      final Response response =
          await client.post(AppConstants.REMOVEBOOKMARK_URI, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> getStudentDashboard() async {
    try {
      final Response response =
          await client.get(AppConstants.GET_STUDENT_DASHBOARD_URI);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> likePosts(String data) async {
    try {
      final Response response =
          await client.post(AppConstants.LIKE_POSTS_URI, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> unLikePosts(String data) async {
    try {
      final Response response =
          await client.post(AppConstants.UNLIKE_POSTS_URI, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
