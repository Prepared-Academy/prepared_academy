import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../data/dio/dio_client.dart';
import '../data/dio/dio_exception.dart';
import '../utils/snackbar.dart';

class NotificationRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> saveFirebaseToken(String data) async {
    try {
      final Response response =
          await client.post(AppConstants.SAVE_FIREBASE_TOKEN, data: data);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
