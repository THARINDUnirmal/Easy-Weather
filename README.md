<div align="center">

<img src="assets/Easy Weather_ Updated UI.png" alt="Easy Weather app banner" width="100%" />

# 🌦️ Easy Weather

A modern Flutter weather app that lets you check current weather conditions using your device location or by searching for a city.

![Flutter](https://img.shields.io/badge/Flutter-Framework-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-Language-0175C2?logo=dart&logoColor=white)
![OpenWeather](https://img.shields.io/badge/Weather_API-OpenWeather-orange)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)

</div>


## ✨ Features

- 🌍 Current weather for your device's location
- 🔎 Search and check weather for other cities
- 🌡️ Temperature displayed in Celsius (metric units)
- 💧 Weather details such as humidity, wind, and atmospheric pressure
- 🌗 Light and dark theme toggle
- 🔄 Refresh weather data and pull-to-refresh
- 📍 Location permission handling
- ⏳ Loading and error states
- 🎨 Modern, responsive Flutter interface

## 🛠️ Built With

- [Flutter](https://flutter.dev/) & Dart
- [OpenWeather API](https://openweathermap.org/api)
- Provider — state management
- Shared Preferences — local preferences
- HTTP — API requests
- Flutter Dotenv — environment configuration
- Lottie — weather animations

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed and configured
- Android Studio or VS Code with Flutter tooling
- An OpenWeather API key

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
cd YOUR-REPOSITORY
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure your API key

Create a `.env` file in the project root:

```env
OPEN_WEATHER_API_KEY=your_openweather_api_key_here
```

Get an API key from [OpenWeather](https://openweathermap.org/api). Keep your API key private—do not commit your `.env` file.

### 4. Run the app

```bash
flutter run
```

## 📸 Screenshots

> Add screenshots of the running app here. Place image files in the `screenshots/` folder, then uncomment and update the example below.


<!--
<div align="center">
  <img src="screenshots/home.png" width="250" alt="Easy Weather home screen" />
  <img src="screenshots/search.png" width="250" alt="City weather search screen" />
</div>
-->

## 📁 Project Structure

```text
lib/
├── main.dart
├── models/
│   └── open_weather_model.dart
├── pages/
│   ├── home_page.dart
│   ├── serch_location_page.dart
│   └── dev_page.dart
├── providers/
│   └── theme_data_provider.dart
├── services/
│   ├── get_location_services.dart
│   ├── weather_services.dart
│   └── theme_preferences_services.dart
├── utils/
│   ├── app_text_styles.dart
│   ├── app_theme_data.dart
│   └── lottie_animation_function.dart
└── widgets/
    └── details_widget.dart
```

## 🔐 Environment Variables

| Variable | Description |
|---|---|
| `OPEN_WEATHER_API_KEY` | API key used to retrieve weather data from OpenWeather |

## 🤝 Contributing

Contributions, suggestions, and bug reports are welcome. Feel free to fork this repository and open a pull request.


## 👨‍💻 Developer

**Tharindu Nirmal**

- GitHub: [@THARINDUnirmal](https://github.com/THARINDUnirmal)


## 📄 License

Choose and add a license file (for example, MIT) if you want to make this project open source under a specific license.


<div align="center">
Made with ❤️ and Flutter
</div>
