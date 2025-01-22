import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/weather_services.dart';
import 'package:flowx/utils/app_text_styles.dart';
import 'package:flowx/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';

class SerchLocationPage extends StatefulWidget {
  const SerchLocationPage({super.key});

  @override
  State<SerchLocationPage> createState() => _SerchLocationPageState();
}

class _SerchLocationPageState extends State<SerchLocationPage> {
  final weatherData =
      WeatherServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");
  OpenWeatherModel? _weather;
  String? _error;

  //text edditing contraller
  final TextEditingController _textContraller = TextEditingController();

  void _serchWeather() async {
    final cityName = _textContraller.text.trim();

    if (cityName.isEmpty) {
      setState(() {
        _error = "Please enter the City name";
      });
      return;
    }
    try {
      final data = await weatherData.getWeatherFromCityName(cityName);
      setState(() {
        _weather = data;
        _error = null;
      });
    } catch (errorr) {
      setState(() {
        _error = "Could not find weather data for $cityName";
      });
      print(errorr.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Weather",
          style: AppTextStyles.subTopicStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _textContraller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  label: Text(
                    'Search City',
                  ),
                  suffixIcon: IconButton(
                    onPressed: _serchWeather,
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
                onSubmitted: (value) => _serchWeather(),
              ),
              _error != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          _error!,
                          style: AppTextStyles.subTopicStyle.copyWith(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : _weather != null
                      ? DetailsWidget(weatherData: _weather!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Lottie.asset(
                              "assets/lotte/loading_2.json",
                              width: double.infinity,
                            ),
                            Text(
                              "Enter the city name do you want !",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.subTopicStyle.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
