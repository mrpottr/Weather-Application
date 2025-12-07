/*import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class WeatherService{

  static const baseurl = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);
  
  //Future<Weather> getWeather(double lat, double lon) async {
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse("$baseurl?q=$cityName&appid=$apiKey&units=metric"));
    //  final response = await http.get(Uri.parse("$baseurl?lat=$lat&lon=$lon&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  } 

  Future<String> getCurrentCity() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      throw Exception("Location services are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    throw Exception("Location permission denied");
    }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    print("DEBUG: got location -> ${position.latitude}, Lng: ${position.longitude}");
    
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      print("DEBUG: Placemarks list: $placemarks");
      if (placemarks.isNotEmpty) {
        String? city = placemarks[0].locality ?? placemarks[0].administrativeArea ?? placemarks[0].country;
        if (city != null) {
          return city;
        } else {
          print("DEBUG: No city found for coordinates.");
          return "Unknown Location";
        }
      } else {
        print("DEBUG: No placemarks found.");
        return "Unknown Location";
      }
    } catch (e) {
      print("ERROR: Error occurred while fetching placemarks: $e");
      return "Unknown Location";
    }
  }
    /*
    List<Placemark> placemarks = 
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print("DEBUG: Placemarks received: $placemarks");

    String? city = placemarks.isNotEmpty ? placemarks[0].locality ?? placemarks[0].administrativeArea ?? placemarks[0].country: null;
    return city ?? "Unknown Location";
  } */
}
  */
  