// import 'package:dio/dio.dart';
// import 'package:prepared_academy/data/dio/api_response.dart';
// import 'package:prepared_academy/data/dio/dio_client.dart';
// import 'package:prepared_academy/models/userModel.dart';
// import 'package:prepared_academy/utils/app_constants.dart';
// import 'package:prepared_academy/utils/snackbar.dart';

// class AuthRepo {
//   Future<UserModel> login(String email, String password) async {
//     const api = "https://www.thepreparedacademy.com/api/muser/login/";
//     final data = {"email": email, "password": password};
//     final dio = Dio();
//     Response response;
//     response = await dio.post(api, data: data);

//     if (response.statusCode == 200) {
//       final body = response.data;
//       return UserModel(user: UserModel.fromJson(data['user']));
//     }
//   }
// }
