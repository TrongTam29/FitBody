import 'package:http/http.dart' as http;
import 'package:my_app/model/equipment/equipment_model.dart';

import '../../constants.dart';

class Services {
  static var client = http.Client();

  static Future<List<Equipment>?> fetchData() async {
    var response = await client
        .get(Uri.parse('$baseUrl/workout-equipment/workout-equipment'));

    if (response.statusCode == 200) {
      var json = response.body;
      return equipmentFromJson(json);
    } else {
      return null;
    }
  }
}
