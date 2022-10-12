import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/helpers/helper.dart';
import 'package:prepared_academy/models/userModel.dart';
import 'package:prepared_academy/repos/auth_repo.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo = AuthRepo();
  final bool _isLoading = false;

  bool showPassword = false;

  bool get isLoading => _isLoading;

  setState() {
    notifyListeners();
  }

  void showHidePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future login(LoginModel loginModel) async {
    try {
      loadingShow();
      String dataJson = loginModelToJson(loginModel);
      Response apiResponse = await authRepo.register(dataJson);
      if (apiResponse.statusCode == 200) {
        OneContext().pushNamedAndRemoveUntil(AppRoutes.NAVIG, (route) => false);
        successRegister();
      }
    } catch (e) {
      rethrow;
    } finally {
      loadingStop();
    }
  }

  void successRegister() {
    QuickAlert.show(
      context: dialogContext,
      type: QuickAlertType.success,
      text: 'Your account is created successfully/',
    );
  }
}
