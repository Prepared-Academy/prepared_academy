import 'package:dio/dio.dart';
import 'package:prepared_academy/data/dio/api_response.dart';
import 'package:prepared_academy/data/dio/dio_client.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/snackbar.dart';

class AuthRepo {
  DioClient dioClient = DioClient();

  Future<ApiResponse> login(Map data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_URI,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (e) {
      // ignore: unnecessary_null_comparison
      if (e.response! == null) {
        NotificationsService.showSnackbar(e.response!.data["message"]);
      }
      throw Exception(e.message);
    }
  }
}
