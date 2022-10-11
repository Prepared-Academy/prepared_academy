import 'package:flutter/cupertino.dart';
import 'package:prepared_academy/data/dio/dio_client.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/utils/shared_preferences.dart';

class SplashRepo {
  void iniChecker(BuildContext context) async {
    String token = await getStringValue(AppConstants.TOKEN);
    DioClient();
  }
}
