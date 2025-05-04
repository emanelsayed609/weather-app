import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wearher_appp/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getweather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '3e326f7b245d4cf4b5193353251901';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
