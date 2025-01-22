import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/pages/serch_location_page.dart';
import 'package:flowx/providers/theme_data_provider.dart';
import 'package:flowx/services/weather_services.dart';
import 'package:flowx/utils/app_text_styles.dart';
import 'package:flowx/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
          "Easy Weather",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _weatherData = null;
                apiCallData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blueAccent,
                    duration: Duration(
                      seconds: 5,
                    ),
                    content: Text(
                      "Refreshing...",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              });
            },
            icon: Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeDataProvider>(context, listen: false)
                  .toggelTheme(Theme.of(context).brightness != Brightness.dark);
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: _weatherData != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsWidget(
                      weatherData: _weatherData!,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.orangeAccent,
                        ),
                        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 13,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SerchLocationPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Search Weather",
                        style: AppTextStyles.buttonStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
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
            ),
    );
  }
}
