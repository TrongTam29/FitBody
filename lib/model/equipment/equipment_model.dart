// To parse this JSON data, do
//
//     final equipment = equipmentFromJson(jsonString);

import 'dart:convert';

List<Equipment> equipmentFromJson(String str) =>
    List<Equipment>.from(json.decode(str).map((x) => Equipment.fromJson(x)));

String equipmentToJson(List<Equipment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipment {
  Equipment({
    this.id,
    this.name,
    this.link,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? link;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
