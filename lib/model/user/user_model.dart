class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  String? id;
  String? name;
  String? email;
  String? image;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
      };
}

class UserComment {
  UserComment({
    this.name,
    this.image,
    this.comment,
  });

  String? name;
  String? image;
  String? comment;

  factory UserComment.fromJson(Map<String, dynamic> json) => UserComment(
        name: json["name"],
        image: json["image"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "comment": comment,
      };
}
