import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/data/dio/dio_exception.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/snackbar.dart';

import '../data/dio/dio_client.dart';

class ProfileRepo {
  var client = GetIt.I<DioClient>();

  Future<Response> getProfileDetails() async {
    try {
      final Response response = await client.get(AppConstants.PROFILE_URI);
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      NotificationsService.showSnackbar(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
