import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static const _apiKey = 'c88fa1c4f8d412f8e8d9d1e1d6132902';
  static const baseUrl = 'http://api.openweathermap.org';

  Future<String> getWeatherData(var lat, var lon) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '$baseUrl/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.statusCode as String;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
