import 'package:http/http.dart' as http;
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';

import '../../constants.dart';

class ExerciseCommentService {
  static var client = http.Client();

  static Future<List<ExerciseComment>?> fetchListComment(int id) async {
    var response = await client.get(
        Uri.parse('$baseUrl/exercise-comment/list-comment?exericseId=$id'));

    if (response.statusCode == 200) {
      var json = response.body;
      return exerciseCommentFromJson(json);
    } else {
      return null;
    }
  }
}
