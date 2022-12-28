import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:prepared_academy/models/getreportmodel.dart';
import 'package:prepared_academy/models/profile_model.dart';
import 'package:prepared_academy/repository/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = true;
  final ProfileRepo profileRepo = ProfileRepo();
  ProfileModel profileModel = ProfileModel();
  List<GetReportModel> getReportModel = [];

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getProfileDetails() async {
    try {
      loading(true);
      Response apiResponse = await profileRepo.getProfileDetails();
      if (apiResponse.statusCode == 200) {
        profileModel = profileModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }

  Future getReports() async {
    try {
      loading(true);
      Response apiResponse = await profileRepo.getStudentReport();
      if (apiResponse.statusCode == 200) {
        getReportModel = getReportModelFromJson(jsonDecode(apiResponse.data));
        notifyListeners();
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }
}
