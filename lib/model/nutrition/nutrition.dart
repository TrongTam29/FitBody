// To parse this JSON data, do
//
//     final nutrition = nutritionFromJson(jsonString);

import 'dart:convert';

Nutrition nutritionFromJson(String str) => Nutrition.fromJson(json.decode(str));

String nutritionToJson(Nutrition data) => json.encode(data.toJson());

class Nutrition {
  Nutrition({
    this.id,
    this.name,
    this.detail,
    this.nutritionId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? detail;
  int? nutritionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        nutritionId: json["nutritionId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail,
        "nutritionId": nutritionId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
