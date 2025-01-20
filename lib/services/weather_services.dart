import 'dart:convert';

import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/get_location_services.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey;

  WeatherServices({
    required this.apiKey,
  });

  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  //get weather from city name
  Future<OpenWeatherModel> getWeatherFromCityName(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl?q=$cityName&appid=$apiKey&units=metric"),
      );

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);
        OpenWeatherModel data = OpenWeatherModel.fromJson(responseData);
        return data;
      } else {
        throw Exception("Error to fetch Data");
      }
    } catch (error) {
      print("Error : $error");
      throw Exception("Error to fetch Data");
    }
  }

  //get weather from current location
  Future<OpenWeatherModel> getWeatherFromCurrentLocation() async {
    try {
      String _currentLocaton = await GetLocationServices().getCurruntLocation();
      final response = await http.get(
        Uri.parse("$baseUrl?q=$_currentLocaton&appid=$apiKey&units=metric"),
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        OpenWeatherModel weatherData = OpenWeatherModel.fromJson(data);
        return weatherData;
      } else {
        throw Exception("Error to fetch data");
      }
    } catch (error) {
      print(error.toString());
      throw Exception("Error to fetch data");
    }
  }
}
