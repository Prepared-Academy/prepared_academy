import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/live_quiz_control_model.dart';
import 'package:prepared_academy/repository/live_quiz_repo.dart';
import 'package:prepared_academy/services/user_service.dart';
import 'package:web_socket_channel/io.dart';
import '../models/live_quiz_model.dart';
import '../models/socket_model.dart';

class LiveQuizProvider extends ChangeNotifier {
  final socket = IOWebSocketChannel.connect(Uri.parse(
      'wss://thepreparedacademy.com:6001/app/3d71466ce7736f2bf208?protocol=7&client=js&version=4.4.0&flash=false'));

  String socketId = "";
  String auth = "";
  String channelData = "";
  String action = "1";

  bool isLoading = true;
  LiveQuizRepo liveQuizRepo = LiveQuizRepo();
  List<LiveQuizModel> liveQuizesList = [];

  // Hold Current Quiz Code Id
  String quizCode = "";

  void loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future init() async {
    try {
      loading(true);
      await getLiveQuizes();

      loading(false);
    } catch (e) {
      loading(false);
    }
  }

  Future getLiveQuizes() async {
    try {
      Response apiResponse = await liveQuizRepo.getLiveQuizes();

      if (apiResponse.statusCode == 200) {
        liveQuizesList = liveQuizModelFromJson(jsonEncode(apiResponse.data));
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void updateQuizCode(String quizCode) {
    listenWebSockets();
    this.quizCode = quizCode;
  }

  initWebSocketSubscriptions() async {
    await getAuth();
    await subscribeUser();
    await getAuth(isPresence: false);
    await subscribeUser(isPresence: false);
  }

  // Listen Websocket

  void listenWebSockets() {
    debugPrint("Web Socket Listening...");
    socket.stream.listen(
      (data) {
        debugPrint(data);
        debugPrint(json.decode(data));

        String jsonsDataString = data.toString();
        final jsonData = jsonDecode(jsonsDataString); //  Get Socket Id
        if (socketId == "") {
          SocketModel socketModel = socketModelFromJson(data);
          var array = json.decode(socketModel.data!);
          socketId = array["socket_id"];
        }

        if (jsonData["event"] == "liveQuizControl") {
          debugPrint("Getting Quiz Action");
          LiveQuizControlModel liveQuizControlModel =
              liveQuizControlModelFromJson(jsonData["data"]);
          action = liveQuizControlModel.action!;
          notifyListeners();
        }

        // channel.sink.close(status.goingAway);
      },
      onDone: () => debugPrint('Done'),
      onError: (error) => debugPrint("Error $error"),
    );
  }

  Future getAuth({bool isPresence = true}) async {
    var response = await Dio().post(
      'https://thepreparedacademy.com/api/broadcasting/auth',
      options: Options(
        headers: {"Authorization": "Bearer ${UserService.token}"},
      ),
      data: {
        "socket_id": socketId,
        "channel_name": isPresence == false
            ? "liveQuiz-$quizCode"
            : "presence-liveQuiz-$quizCode",
      },
    );
    if (response.statusCode == 200) {
      auth = response.data["auth"];
      channelData = response.data["channel_data"];
    }
  }

  Future subscribeUser({bool isPresence = true}) async {
    socket.sink.add(
      jsonEncode({
        "event": "pusher:subscribe",
        "data": {
          "auth": auth,
          "channel_data": channelData,
          "channel": isPresence == false
              ? "liveQuiz-$quizCode"
              : "presence-liveQuiz-$quizCode",
        },
      }),
    );
  }

  void disposeStream() {
    socket.sink.close();
    socketId = "";
    auth = "";
    channelData = "";
    action = "1";
  }
}
