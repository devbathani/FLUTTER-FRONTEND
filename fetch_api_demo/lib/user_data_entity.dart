// To parse this JSON data, do
//
//     final userDataEntity = userDataEntityFromJson(jsonString);

import 'dart:convert';

List<UserDataEntity> userDataEntityFromJson(String str) =>
    List<UserDataEntity>.from(
        json.decode(str).map((x) => UserDataEntity.fromJson(x)));

String userDataEntityToJson(List<UserDataEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataEntity {
  int userId;
  int id;
  String title;
  String body;

  UserDataEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => UserDataEntity(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
