// To parse this JSON data, do
//
//     final exerciseComment = exerciseCommentFromJson(jsonString);

import 'dart:convert';

List<ExerciseComment> exerciseCommentFromJson(String str) =>
    List<ExerciseComment>.from(
        json.decode(str).map((x) => ExerciseComment.fromJson(x)));

ExerciseComment exerciseCommentModelFromJson(String str) =>
    ExerciseComment.fromJson(json.decode(str));

String exerciseCommentToJson(List<ExerciseComment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String exerciseCommentModelToJson(Comment data) => json.encode(data.toJson());

class ExerciseComment {
  ExerciseComment({
    this.id,
    this.userId,
    this.exerciseId,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? exerciseId;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ExerciseComment.fromJson(Map<String, dynamic> json) =>
      ExerciseComment(
        id: json["id"],
        userId: json["userId"],
        exerciseId: json["exerciseId"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "exerciseId": exerciseId,
        "comment": comment,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Comment {
  Comment({
    this.userId,
    this.exerciseId,
    this.comment,
  });
  int? userId;
  int? exerciseId;
  String? comment;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "exerciseId": exerciseId,
        "comment": comment,
      };
}
