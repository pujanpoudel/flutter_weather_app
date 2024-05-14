import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  final String apiKey;
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  WeatherService({required this.apiKey});

  Future<Weather> fetchWeatherByLocation(String location) async {
    final response = await http.get('$baseUrl?key=$apiKey&q=$location' as Uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> fetchWeatherByCoordinates(
      double latitude, double longitude) async {
    final response =
        await http.get('$baseUrl?key=$apiKey&q=$latitude,$longitude' as Uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
