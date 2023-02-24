import 'package:http/http.dart' as http;
import 'package:my_app/model/nutrition/nutrition.dart';

import '../../constants.dart';

class NutritionServices {
  static var client = http.Client();

  static Future<Nutrition?> fetchData(int nutritionId, String nameDay) async {
    var response = await client
        .get(Uri.parse('$baseUrl/day/get-day-diet/$nutritionId/$nameDay'));

    if (response.statusCode == 200) {
      var json = response.body;
      return nutritionFromJson(json);
    } else {
      return null;
    }
  }
}
