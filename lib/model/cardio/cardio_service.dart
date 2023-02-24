import 'package:http/http.dart' as http;
import 'package:my_app/model/cardio/cardio_model.dart';

import '../../constants.dart';

class CardioService {
  static var client = http.Client();

  static Future<List<Cardio>?> fetchData() async {
    var response = await client.get(Uri.parse('$baseUrl/cardio/cardios'));

    if (response.statusCode == 200) {
      var json = response.body;
      return cardioFromJson(json);
    } else {
      return null;
    }
  }

  static Future<Cardio?> findCardio(String link) async {
    var response = await client.get(Uri.parse(
        'http://192.168.1.7:3000/cardio/find-cardio-by-link?link=$link'));

    if (response.statusCode == 200) {
      var json = response.body;
      return cardioModelFromJson(json);
    } else {
      return null;
    }
  }
}
