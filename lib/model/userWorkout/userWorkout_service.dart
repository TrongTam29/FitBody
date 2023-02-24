import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/userWorkout/userWorkout_model.dart';

import '../../constants.dart';

class UserWorkoutService {
  static var client = http.Client();

  static Future<UserWorkout?> fetchData(String id) async {
    var response = await client
        .get(Uri.parse('$baseUrl/user-workout/get-user-workout/?userId=$id'));

    if (response.statusCode == 200) {
      var json = response.body;
      return userWorkoutFromJson(json);
    } else {
      return null;
    }
  }

  static Future<String?> checkUserWorkout(String userId) async {
    var response = await client.get(
        Uri.parse('$baseUrl/user-workout/check-user-workout/?userId=$userId'));

    if (response.statusCode == 200) {
      var json = response.body;
      return json;
    } else {
      return null;
    }
  }

  static Future<http.Response?> createUserWorkout(String userId) async {
    Map data = {
      "monday": [],
      "tuesday": [],
      "wednesday": [],
      "thursday": [],
      "friday": [],
      "saturday": [],
      "userId": userId,
    };
    var body = json.encode(data);
    http.Response response = await client.post(
        Uri.parse('$baseUrl/user-workout/create-user-workout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response;
  }

  static Future<http.Response?> updateWorkout(
    String userId,
    List monday,
    List tuesday,
    List wednesday,
    List thursday,
    List friday,
    List saturday,
  ) async {
    Map data = {
      "monday": monday,
      "tuesday": tuesday,
      "wednesday": wednesday,
      "thursday": thursday,
      "friday": friday,
      "saturday": saturday,
    };
    var body = jsonEncode(data);
    http.Response response = await client.put(
        Uri.parse('$baseUrl/user-workout/update-user-workout?userId=$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response;
  }

  static Future<http.Response?> updateMonday(
    String userId,
    List monday,
  ) async {
    Map data = {
      "userId": userId,
      "monday": monday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-monday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<http.Response?> updateTuesday(
    String userId,
    List tuesday,
  ) async {
    Map data = {
      "userId": userId,
      "tuesday": tuesday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-tuesday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<http.Response?> updateWednesday(
    String userId,
    List wednesday,
  ) async {
    Map data = {
      "userId": userId,
      "wednesday": wednesday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-wednesday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<http.Response?> updateThursday(
    String userId,
    List thursday,
  ) async {
    Map data = {
      "userId": userId,
      "thursday": thursday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-thursday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<http.Response?> updateFriday(
    String userId,
    List friday,
  ) async {
    Map data = {
      "userId": userId,
      "monday": friday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-friday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<http.Response?> updateSaturday(
    String userId,
    List saturday,
  ) async {
    Map data = {
      "userId": userId,
      "saturday": saturday,
    };
    var body = jsonEncode(data);
    http.Response response =
        await client.patch(Uri.parse('$baseUrl/user-workout/update-saturday'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }
}
