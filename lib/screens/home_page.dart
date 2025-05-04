import 'package:flutter/material.dart';
import 'package:wearher_appp/models/weather_model.dart';
import 'package:wearher_appp/providers/weather_provider.dart';
import 'package:wearher_appp/screens/search_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? WeatherData;
  @override
  Widget build(BuildContext context) {
    WeatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeatherData!.getThemeColor(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: WeatherData == null
          ? Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'There is no weather 😔 start',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'Searching now🔎',
                  style: TextStyle(fontSize: 22),
                ),
              ]),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:
                [WeatherData!.getThemeColor(),
                WeatherData!.getThemeColor()[300]!,
                WeatherData!.getThemeColor()[100]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    '${Provider.of<WeatherProvider>(context).cityName}',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated: ${WeatherData!.date.hour.toString()} : ${WeatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        WeatherData!.getImage(),
                        height: 200,
                        width: 100,
                      ),
                      Text(
                        '${WeatherData!.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('MaxTemp : ${WeatherData!.maxTemp.toInt()}'),
                          Text('MinTemp : ${WeatherData!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  const Spacer(flex: 1),
                  Text(
                    WeatherData!.weatherStateName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
