import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/models/user_model.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/shared_preference.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../setup.dart';
import '../utils/snackbar.dart';

class AuthRepo {
  var client = GetIt.I<DioClient>();
  final locator = getIt.get<SharedPreferencesHelper>();

  Future<Response> login(String dataJson) async {
    try {
      final Response response =
          await client.post(AppConstants.LOGIN_URI, data: dataJson);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> register(String dataJson) async {
    try {
      final Response response =
          await client.post(AppConstants.REGISTRATION_URI, data: dataJson);

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> creatLoginTime(int id) async {
    try {
      final Response response = await client
          .post(AppConstants.CREATE_LOGIN_TIME_URI, data: {"id": id});

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> updateLogoutTime(int id) async {
    try {
      final Response response = await client
          .post(AppConstants.UPDATE_LOGOUT_TIME_URI, data: {"id": id});

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> forgotsentOTP(String dataJson) async {
    try {
      final Response response =
          await client.post(AppConstants.SEND_OTP_URI, data: dataJson);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> verifyOTP(String dataJson) async {
    try {
      final Response response =
          await client.post(AppConstants.VERIFY_OTP_URI, data: dataJson);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<Response> updatePassword(String dataJson) async {
    try {
      final Response response =
          await client.post(AppConstants.UPDATE_PASS_URI, data: dataJson);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future saveUser(UserModel userModel) async {
    String json = userModelToJson(userModel);
    await locator.setStringValue(AppConstants.TOKEN, userModel.accessToken!);
    await locator.setStringValue(AppConstants.USER, json);
  }
}
