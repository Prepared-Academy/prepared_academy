import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/models/user_model.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/shared_preference.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class ClassActivityRepo {
  var client = GetIt.I<DioClient>();

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

  Future saveUser(UserModel userModel) async {
    String json = userModelToJson(userModel);
    await setStringValue(AppConstants.TOKEN, userModel.accessToken!);
    await setStringValue(AppConstants.USER, json);
  }

  Future<Stream<String?>> getUser() async {
    return myPrefs.getStringStream(AppConstants.USER);
  }
}
