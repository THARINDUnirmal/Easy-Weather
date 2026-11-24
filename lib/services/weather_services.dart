import 'dart:convert';
import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/get_location_services.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey;
  WeatherServices({required this.apiKey});
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<OpenWeatherModel> getWeatherFromCityName(String cityName) async {
    if (apiKey.isEmpty) throw Exception('Weather API key is missing.');
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      'q': cityName, 'appid': apiKey, 'units': 'metric',
    });
    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      return OpenWeatherModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Unable to fetch weather (${response.statusCode}).');
  }

  Future<OpenWeatherModel> getWeatherFromCurrentLocation() async {
    if (apiKey.isEmpty) throw Exception('Weather API key is missing.');
    final coordinates = await GetLocationServices().getCurruntLocation();
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      'lat': coordinates[0].toString(), 'lon': coordinates[1].toString(),
      'appid': apiKey, 'units': 'metric',
    });
    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    if (response.statusCode == 200) {
      return OpenWeatherModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Unable to fetch weather (${response.statusCode}).');
  }
}
