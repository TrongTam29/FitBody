// To parse this JSON data, do
//
//     final cardio = cardioFromJson(jsonString);

import 'dart:convert';

List<Cardio> cardioFromJson(String str) =>
    List<Cardio>.from(json.decode(str).map((x) => Cardio.fromJson(x)));

Cardio cardioModelFromJson(String str) => Cardio.fromJson(json.decode(str));

String cardioToJson(List<Cardio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cardio {
  Cardio({
    this.id,
    this.name,
    this.image,
    this.link,
    this.duration,
    this.exerTime,
    this.breakTime,
    this.focus,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  String? link;
  String? duration;
  String? exerTime;
  String? breakTime;
  String? focus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cardio.fromJson(Map<String, dynamic> json) => Cardio(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        link: json["link"],
        duration: json["duration"],
        exerTime: json["exerTime"],
        breakTime: json["breakTime"],
        focus: json["focus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "link": link,
        "duration": duration,
        "exerTime": exerTime,
        "breakTime": breakTime,
        "focus": focus,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
