import 'dart:convert';

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
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? link;
  String? image;
  String? reps;
  String? sets;
  String? exerciseBreak;
  String? detail;
  int? muscleGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        image: json["image"],
        reps: json["reps"],
        sets: json["sets"],
        exerciseBreak: json["break"],
        detail: json["detail"],
        muscleGroupId: json["muscleGroupId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
