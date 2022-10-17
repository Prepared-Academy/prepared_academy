// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';

StoryModel storyModelFromJson(String str) =>
    StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel {
  StoryModel({
    this.facts,
    this.historicalEvents,
    this.proverbs,
    this.testEntry,
  });

  final List<Fact>? facts;
  final List<Fact>? historicalEvents;
  final List<Fact>? proverbs;
  final List<dynamic>? testEntry;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        facts: json["Facts"] == null
            ? null
            : List<Fact>.from(json["Facts"].map((x) => Fact.fromJson(x))),
        historicalEvents: json["HistoricalEvents"] == null
            ? null
            : List<Fact>.from(
                json["HistoricalEvents"].map((x) => Fact.fromJson(x))),
        proverbs: json["Proverbs"] == null
            ? null
            : List<Fact>.from(json["Proverbs"].map((x) => Fact.fromJson(x))),
        testEntry: json["Test entry"] == null
            ? null
            : List<dynamic>.from(json["Test entry"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Facts": facts == null
            ? null
            : List<dynamic>.from(facts!.map((x) => x.toJson())),
        "HistoricalEvents": historicalEvents == null
            ? null
            : List<dynamic>.from(historicalEvents!.map((x) => x.toJson())),
        "Proverbs": proverbs == null
            ? null
            : List<dynamic>.from(proverbs!.map((x) => x.toJson())),
        "Test entry": testEntry == null
            ? null
            : List<dynamic>.from(testEntry!.map((x) => x)),
      };
}

class Fact {
  Fact({
    this.id,
    this.title,
    this.content,
    this.publishDate,
    this.bookmarkStatus,
    this.bookmarkId,
    this.typeId,
    this.status,
  });

  final int? id;
  final String? title;
  final String? content;
  final DateTime? publishDate;
  final int? bookmarkStatus;
  final int? bookmarkId;
  final int? typeId;
  final int? status;

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        publishDate: json["publishDate"] == null
            ? null
            : DateTime.parse(json["publishDate"]),
        bookmarkStatus: json["bookmarkStatus"],
        bookmarkId: json["bookmarkId"],
        typeId: json["typeId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "publishDate":
            publishDate == null ? null : publishDate!.toIso8601String(),
        "bookmarkStatus": bookmarkStatus,
        "bookmarkId": bookmarkId,
        "typeId": typeId,
        "status": status,
      };
}

// Story Package
// Story Model to view stories

class StoryUsers {
  StoryUsers(this.stories, this.userName, this.imageUrl);

  final List<Fact> stories;
  final String userName;
  final String imageUrl;
}
