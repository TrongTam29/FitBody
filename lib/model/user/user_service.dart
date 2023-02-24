import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/user/user_model.dart';

import '../../constants.dart';

class UserService {
  static var client = http.Client();

  static Future<UserModel?> findUser(String account) async {
    var response = await client
        .get(Uri.parse('$baseUrl/user/get-user-by-account?account=$account'));

    if (response.body.isNotEmpty) {
      var json = response.body;
      // return userFromJson(json);
    } else {
      return null;
    }
  }

  static Future<UserModel?> findUserById(int id) async {
    var response =
        await client.get(Uri.parse('$baseUrl/user/get-user-by-id?id=$id'));
    if (response.body.isNotEmpty) {
      var json = response.body;
      // return userFromJson(json);
    } else {
      return null;
    }
  }

  static Future<http.Response?> createUser(
      String name, String email, String image) async {
    Map data = {"name": name, "email": email, "image": image};
    var body = json.encode(data);
    http.Response response =
        await client.post(Uri.parse('$baseUrl/user/create-user'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }
}
