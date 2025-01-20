class OpenWeatherModel {
  final String cityName;
  final double temp;
  final String mainCondition;
  final String description;
  final double windSpeed;
  final double humidity;
  final double pressure;

  OpenWeatherModel({
    required this.cityName,
    required this.temp,
    required this.mainCondition,
    required this.description,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
  });

  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherModel(
      cityName: json["name"],
      temp: json["main"]["temp"].toDouble(),
      mainCondition: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      windSpeed: json["wind"]["speed"].toDouble(),
      humidity: json["main"]["humidity"].toDouble(),
      pressure: json["main"]["pressure"].toDouble(),
    );
  }
}
