import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/dio/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupInit() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  // getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  // getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  // getIt.registerSingleton(HomeController());
}
