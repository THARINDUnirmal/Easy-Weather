import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/weather_services.dart';
import 'package:flowx/utils/app_text_styles.dart';
import 'package:flowx/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherServices _weatherServices =
      WeatherServices(apiKey: dotenv.env['OPEN_WEATHER_API_KEY'] ?? "");

  OpenWeatherModel? _weatherData;

  void apiCallData() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final data = await _weatherServices.getWeatherFromCurrentLocation();
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    apiCallData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Flowx Weather",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Icon(
              Icons.light_mode,
              size: 30,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: _weatherData != null
            ? SingleChildScrollView(
                child: DetailsWidget(
                  weatherData: _weatherData!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/loading_2.json",
                    width: double.infinity,
                  ),
                  Text(
                    "Loading...",
                    style: AppTextStyles.subTopicStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ));
  }
}
