import 'package:flutter/material.dart';
import 'package:wearher_appp/models/weather_model.dart';
import 'package:wearher_appp/providers/weather_provider.dart';
import 'package:wearher_appp/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? weathercity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onSubmitted: (data) async {
                weathercity = data;
                WeatherService service = WeatherService();
                WeatherModel weather =
                    await service.getweather(cityName: weathercity!);
                Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName = weathercity;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  hintText: 'Enter a City',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 22, horizontal: 30),
                  label: Text('Search'),
                  suffix: Icon(Icons.search)),
            ),
          ),
        ));
  }
}
