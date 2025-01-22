class LottieAnimationFunction {
  String lottieMethord(String condition) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/lotte/cloudy.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/lotte/rain.json";

      case "thunderstorm":
        return "assets/lotte/thunder_rain.json";

      case "clear":
        return "assets/lotte/sun_animation.json";

      default:
        return "assets/lotte/sun_animation.json";
    }
  }
}
