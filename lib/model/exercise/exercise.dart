import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Exercise> exerciseFromJson(String str) =>
    List<Exercise>.from(json.decode(str).map((x) => Exercise.fromJson(x)));

Exercise exerciseModelFromJson(String str) =>
    Exercise.fromJson(json.decode(str));

String exerciseToJson(List<Exercise> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exercise {
  Exercise({
    this.id,
    this.name,
    this.link,
    this.image,
    this.reps,
    this.sets,
    this.exerciseBreak,
    this.detail,
    this.muscleGroupId,
  });

  String? id;
  String? name;
  String? link;
  String? image;
  String? reps;
  String? sets;
  String? exerciseBreak;
  String? detail;
  int? muscleGroupId;

  factory Exercise.fromJson(DocumentSnapshot json) => Exercise(
        id: json.id,
        name: json["name"],
        link: json["link"],
        image: json["image"],
        reps: json["reps"],
        sets: json["sets"],
        exerciseBreak: json["break"],
        detail: json["detail"],
        muscleGroupId: json["muscleGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "image": image,
        "reps": reps,
        "sets": sets,
        "break": exerciseBreak,
        "detail": detail,
        "muscleGroupId": muscleGroupId,
      };
}
