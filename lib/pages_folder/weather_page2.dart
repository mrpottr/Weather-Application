//Student name: Minindu Mihiraj Shashadhara Baranasuriya
//Student Id: 10696409
//Lecturer: Mr. Maneesha Caldera
//Unit Name: Introduction to Mobile Application Development
//Unit Id: CSP2108
//Institute: Edith Cowan University - Sri Lanka

import 'package:flutter/material.dart';
import 'package:weather_fetcher_app/models/weather_model.dart';
import 'package:weather_fetcher_app/services/weather_service2.dart';
import 'package:geolocator/geolocator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService("8eed3076f180bd87019d38f11b0314fb");
  Weather? _weather;
  bool _isLoading = true;

  _fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      final weather = await _weatherService.getWeather(position.latitude, position.longitude);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      print("ERROR: $e");
      setState(() {
        _isLoading = false;
      });
    } }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _weather != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather!.cityName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
            Text('${_weather!.temperature.round()}℃', style: const TextStyle(fontSize: 30)),
            Text(_weather?.mainCondition ?? "", style: TextStyle(fontSize: 25, color: Colors.deepPurple),)
          ],
        )
            : const Text("Failed to fetch weather", style: TextStyle(color: Colors.red)),
      ), backgroundColor: const Color.fromARGB(255, 138, 252, 157),
    );
  }
}
