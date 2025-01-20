class LottieAnimationFunction {
  String lottieMethord(String condition) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rain.json";

      case "thunderstorm":
        return "assets/thunder_rain.json";

      case "clear":
        return "assets/sun_animation.json";

      default:
        return "assets/sun_animation.json";
    }
  }
}
