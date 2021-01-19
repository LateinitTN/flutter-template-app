import 'dart:convert';
import '../base_response/base_response.dart';

AlbumResponse albumResponseFromJson(String str) => AlbumResponse.fromJson(json.decode(str));

String albumResponseToJson(AlbumResponse data) => json.encode(data.toJson());

class AlbumResponse extends BaseResponse {
  AlbumResponse({
    this.userId,
    this.id,
    this.title,
  });

  int userId;
  int id;
  String title;

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
