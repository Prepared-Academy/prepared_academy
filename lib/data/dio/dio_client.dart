import 'dart:io';
import 'package:dio/dio.dart';

import '../../utils/app_constants.dart';

class DioClient {
  Dio dio = Dio();
  final baseUrl = AppConstants.BASE_URL;
  // String token = "";

  // DioClient() {
  //   token = sharedPreferences.getString(AppConstants.TOKEN);
  //   BaseOptions options = BaseOptions(
  //     baseUrl: _baseUrl,
  //     receiveDataWhenStatusError: true,
  //     connectTimeout: 30000,
  //     receiveTimeout: 30000,
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );

  //   dio = Dio(options);
  // }
  // Future init() async {
  //   token = await getStringValue(AppConstants.TOKEN) ?? "";
  //   debugPrint("TOKEN: $token");

  //   dio.options.baseUrl = _baseUrl;
  //   dio.options.connectTimeout = 30000;
  //   dio.options.receiveTimeout = 30000;
  //   dio.httpClientAdapter;
  //   dio.options.headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   };
  //   dio.interceptors.add(LoggingInterceptor());
  // }

  // void updateHeader(String token) {
  //   token = token;
  //   this.token = token;
  //   dio.options.headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        baseUrl + uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

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
      var response = await dio.post(
        baseUrl + uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

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
      // SharedPreferences sp = await SharedPreferences.getInstance();
      if (options == null) {
        options = Options(
          headers: {
            // 'branch_id': sp.getString(AppConstants.BRANCH_ID) ?? 1,
          },
        );
      } else {
        // options.headers['branch_id'] =
        //     sp.getString(AppConstants.BRANCH_ID) ?? 1;
      }
      var response = await dio.put(
        baseUrl + uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      // SharedPreferences sp = await SharedPreferences.getInstance();
      if (options == null) {
        options = Options(
          headers: {
            // 'branch_id': sp.getString(AppConstants.BRANCH_ID) ?? 1,
          },
        );
      } else {
        // options.headers['branch_id'] =
        //     int.parse(sp.getString(AppConstants.BRANCH_ID)) ?? 1;
      }
      var response = await dio.delete(
        baseUrl + uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
