import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/story_model.dart';
import 'package:prepared_academy/repository/home_repo.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;

  final HomeRepo homeRepo = HomeRepo();
  StoryModel storyModel = StoryModel();
  List<StoryUsers> story = [];
  late StoryUsers storyUsers;
  late Fact fact;
  int currentStoryIndex = 0;

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getStory() async {
    try {
      Response apiResponse = await homeRepo.stories();

      if (apiResponse.statusCode == 200) {
        storyModel = StoryModel.fromJson(apiResponse.data);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future addStoryBookMark(int refId, int typeId) async {
    try {
      var data = {"refId": refId, "typeId": typeId};
      Response apiResponse = await homeRepo.addBookMarkStory(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        // refresh stories
        getStory();
        // refresh story page
        storyView(index: currentStoryIndex);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future removeBookmarkStory(int bookMarkId) async {
    try {
      var data = {"bookmarkId": bookMarkId};
      Response apiResponse =
          await homeRepo.removeBookmarkStory(jsonEncode(data));
      if (apiResponse.statusCode == 200) {
        if (apiResponse.data["message"] == "Removed from Bookmarks") {
          // refresh stories
          getStory();
          // refresh story page
          storyView(index: currentStoryIndex);
          notifyListeners();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void storyView({int? index}) {
    List<Fact>? storyModel1 = [];
    story = [];

    if (index == 0) {
      storyModel1 = storyModel.facts;
    } else if (index == 1) {
      storyModel1 = storyModel.historicalEvents;
    } else if (index == 2) {
      storyModel1 = storyModel.proverbs;
    }
    story.add(
      StoryUsers(
        storyModel1!,
        AppConstants.storyList[currentStoryIndex]["name"],
        AppConstants.storyList[currentStoryIndex]["image"],
      ),
    );
  }
}
