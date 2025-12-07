//Student name: Minindu Mihiraj Shashadhara Baranasuriya
//Student Id: 10696409
//Lecturer: Mr. Maneesha Caldera
//Unit Name: Introduction to Mobile Application Development
//Unit Id: CSP2108
//Institute: Edith Cowan University - Sri Lanka

import 'package:flutter/material.dart';
import 'package:weather_fetcher_app/pages_folder/weather_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}  