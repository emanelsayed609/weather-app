import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'temp = $temp mintemp = $minTemp date = $date';
  }

  String getImage() {
    if (weatherStateName == 'Moderate rain'||weatherStateName == 'Patchy rain nearby') {
      return 'assets/images/rainy.webp';
    }
    else if (weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    }
    else if (weatherStateName == 'Snow') {
      return 'assets/images/snow.png';
    }
    else if (weatherStateName == 'Partly Cloudy'|| weatherStateName=='Mist'||weatherStateName=='Overcast') {
      return 'assets/images/cloudy.png';
    }
    else{
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (weatherStateName == 'Moderate rain'||weatherStateName == 'Patchy rain nearby') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Sunny') {
      return Colors.orange;
    }
    else if (weatherStateName == 'Snow') {
      return Colors.blueGrey;
    }
    else if (weatherStateName == 'Partly Cloudy'|| weatherStateName=='Mist'||weatherStateName=='Overcast') {
      return Colors.blueGrey;
    }
    else{
      return Colors.orange;
    }
  }
}
