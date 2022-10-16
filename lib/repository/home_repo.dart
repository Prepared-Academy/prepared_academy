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
      final Response response = await client.get(
        AppConstants.STORY_URI,
        // options: Options(
        //   headers: {
        //     'Content-Type': 'application/json; charset=UTF-8',
        //     'Authorization': 'Bearer ${client.token}',
        //   },
        // )
      );
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
