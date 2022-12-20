import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/utils/shared_preference.dart';
import 'package:provider/provider.dart';

import '../../setup.dart';
import '../../utils/app_constants.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;
  final _prefsLocator = getIt.get<SharedPreferencesHelper>();
  LoggingInterceptor();
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await _prefsLocator.getStringValue(AppConstants.TOKEN);
    options.headers["Authorization"] = "Bearer $token";
    debugPrint("--> ${options.method} ${options.path}");
    debugPrint("Headers: ${options.headers.toString()}");
    debugPrint("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint(response.data.toString());
    }

    debugPrint("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");

    if (err.response?.statusCode == 401) {
      //catch the 401 here

      debugPrint('REVOKED TOKEN USED -----> LOGOUT USER NOW');
      OneContext().context!.read<AuthProvider>().logout();
      handler.next(err);
    }

    return super.onError(err, handler);
  }
}
