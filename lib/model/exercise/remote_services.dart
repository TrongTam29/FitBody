import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/exercise/exercise.dart';

import '../../constants.dart';

class ExerciseService {
  static var client = http.Client();

  static Future<List<Exercise>?> fetchData(int id) async {
    var response =
        await client.get(Uri.parse('$baseUrl/exercise/find-exercises?id=$id'));

    if (response.statusCode == 200) {
      var json = response.body;
      return exerciseFromJson(json);
    } else {
      return null;
    }
  }

  static Future<http.Response?> postExercise(
      String name,
      String link,
      String image,
      String reps,
      String sets,
      String exerciseBreak,
      String detail,
      int muscleGroupId) async {
    Map data = {
      "name": name,
      "link": link,
      "image": image,
      "reps": reps,
      "sets": sets,
      "break": exerciseBreak,
      "detail": detail,
      "muscleGroupId": muscleGroupId,
    };
    var body = json.encode(data);
    http.Response response =
        await client.post(Uri.parse('$baseUrl/exercise/create-exercise'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<Exercise?> findExercise(String link) async {
    var response = await client
        .get(Uri.parse('$baseUrl/exercise/find-exercise-by-link?link=$link'));

    if (response.statusCode == 200) {
      var json = response.body;
      return exerciseModelFromJson(json);
    } else {
      return null;
    }
  }
}
