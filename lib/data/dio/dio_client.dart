import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prepared_academy/data/dio/logging_interceptor.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../../utils/shared_preference.dart';

class DioClient {
  // dio instance
  final Dio _dio;
  String? token;

  // injecting dio instance
  DioClient(this._dio) {
    getToken();
    _dio
      ..options.baseUrl = AppConstants.BASE_URL
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..interceptors.add(LoggingInterceptor());
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future getToken() async {
    debugPrint("######## Calling Get Token From Dio ########");
    final data = myPrefs.getStringStream(AppConstants.TOKEN);
    data.listen((event) {
      token = event;
      debugPrint("######## Token Changed ########");
    });
  }
}
