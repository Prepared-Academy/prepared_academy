import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class AuthRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> login() async {
    try {
      final Response response =
          await client.post(AppConstants.LOGIN_URI, data: {
        "email": "hello@gmail.com",
        "password": "12345678",
      });
      return response;
    } on DioError catch (e) {
      NotificationsService.showSnackbar(e.response!.data["message"]);
      final errorMessage = DioExceptions.fromDioError(e).toString();

      throw Exception(errorMessage);
    }
  }
}
