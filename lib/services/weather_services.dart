import 'dart:convert';

import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/get_location_services.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey;

  WeatherServices({
    required this.apiKey,
  });

  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather";

  //get weather from city name
  Future<OpenWeatherModel> getWeatherFromCityName(String cityName) async {
    try {
      final url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        OpenWeatherModel data = OpenWeatherModel.fromJson(responseData);
        return data;
      } else {
        throw Exception("Error to fetch Data");
      }
    } catch (error) {
      throw Exception("Error to fetch Data");
    }
  }

  //get weather from current location
  Future<OpenWeatherModel> getWeatherFromCurrentLocation() async {
    final location = GetLocationServices();
    final cityList = await location.getCurruntLocation();

    final lati = cityList[0];
    final long = cityList[1];

    final url = '$baseUrl?lat=$lati&lon=$long&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      OpenWeatherModel weatherData = OpenWeatherModel.fromJson(data);
      return weatherData;
    } else {
      throw Exception("Error to fetch data");
    }
  }
}
