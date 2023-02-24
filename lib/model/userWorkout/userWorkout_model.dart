// To parse this JSON data, do
//
//     final userWorkout = userWorkoutFromJson(jsonString);

import 'dart:convert';

UserWorkout userWorkoutFromJson(String str) =>
    UserWorkout.fromJson(json.decode(str));

String userWorkoutToJson(UserWorkout data) => json.encode(data.toJson());

class UserWorkout {
  UserWorkout({
    this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  List<String>? monday;
  List<String>? tuesday;
  List<String>? wednesday;
  List<String>? thursday;
  List<String>? friday;
  List<String>? saturday;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserWorkout.fromJson(Map<String, dynamic> json) => UserWorkout(
        id: json["id"],
        monday: List<String>.from(json["monday"].map((x) => x)),
        tuesday: List<String>.from(json["tuesday"].map((x) => x)),
        wednesday: List<String>.from(json["wednesday"].map((x) => x)),
        thursday: List<String>.from(json["thursday"].map((x) => x)),
        friday: List<String>.from(json["friday"].map((x) => x)),
        saturday: List<String>.from(json["saturday"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "monday": List<dynamic>.from(monday!.map((x) => x)),
        "tuesday": List<dynamic>.from(tuesday!.map((x) => x)),
        "wednesday": List<dynamic>.from(wednesday!.map((x) => x)),
        "thursday": List<dynamic>.from(thursday!.map((x) => x)),
        "friday": List<dynamic>.from(friday!.map((x) => x)),
        "saturday": List<dynamic>.from(saturday!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
