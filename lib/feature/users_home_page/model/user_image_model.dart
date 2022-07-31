import 'dart:convert';

UserImageModel userImageModelFromJson(String str) =>
    UserImageModel.fromJson(json.decode(str));

String userImageModelToJson(UserImageModel data) => json.encode(data.toJson());

class UserImageModel {
  UserImageModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory UserImageModel.fromJson(Map<String, dynamic> json) => UserImageModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
