import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prepared_academy/utils/shared_preference.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'data/dio/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupInit() async {
  final prefs = RxSharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferencesHelper>(
      SharedPreferencesHelper(myPrefs: prefs));
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
}
