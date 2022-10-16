import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prepared_academy/models/login_model.dart';
import 'package:prepared_academy/repository/class_acitvity_repo.dart';

class ClassActivityProvider extends ChangeNotifier {
  bool isLoading = true;
  final ClassActivityRepo classActivityRepo = ClassActivityRepo();
  final StreamController<LoginModel> _streamController = StreamController();

  // a future method that fetch data from API
  Future<void> getCryptoPrice() async {
    // var url = Uri.parse(
    //     'https://api.nomics.com/v1/currencies/ticker?key=your_api_key&ids=DOGE');
    // final response = Dio().get("url");
    // final databody = json.decode(response.body).first;
    // DataModel dataModel = DataModel.fromJson(databody);
    // add API response to stream controller sink
    LoginModel loginModel = LoginModel();
    _streamController.sink.add(loginModel);
  }

  iit() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      getCryptoPrice();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _streamController.close();
  }

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
