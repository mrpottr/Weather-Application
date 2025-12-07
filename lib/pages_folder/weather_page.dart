/*import 'package:flutter/material.dart';
import 'package:weather_fetcher_app/models/weather_model.dart';
import 'package:weather_fetcher_app/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _weatherService = WeatherService("8eed3076f180bd87019d38f11b0314fb");
  Weather? _weather;
  
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
  
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

   catch (e) {
      setState(() {
      });(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_weather?.cityName ?? "Loading the city..."), 
          Text('${_weather?.temperature.round()}℃')
        ],
      )),
    );
  }
}

*/