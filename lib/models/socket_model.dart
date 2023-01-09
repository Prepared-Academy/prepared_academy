import 'dart:convert';

SocketModel socketModelFromJson(String str) =>
    SocketModel.fromJson(json.decode(str));

String socketModelToJson(SocketModel data) => json.encode(data.toJson());

class SocketModel {
  SocketModel({
    this.event,
    this.data,
  });

  String? event;
  String? data;

  factory SocketModel.fromJson(Map<String, dynamic> json) => SocketModel(
        event: json["event"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "event": event,
        "data": data,
      };
}
