import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/pages/dev_page.dart';
import 'package:flowx/utils/app_text_styles.dart';
import 'package:flowx/utils/lottie_animation_function.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsWidget extends StatelessWidget {
  final OpenWeatherModel weatherData;

  const DetailsWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DevPage(),
              ),
            );
          },
          child: Lottie.asset(
            LottieAnimationFunction().lottieMethord(weatherData.mainCondition),
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          weatherData.cityName,
          style: AppTextStyles.topicStyle.copyWith(fontSize: 25),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${weatherData.temp.toStringAsFixed(2).toString()}ºC",
              style: AppTextStyles.topicStyle.copyWith(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              children: [
                Text(
                  weatherData.mainCondition,
                  style: AppTextStyles.subTopicStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Lottie.asset(
                  LottieAnimationFunction()
                      .lottieMethord(weatherData.mainCondition),
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          weatherData.description,
          style: AppTextStyles.subTopicStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            columnWidget(
              title: "Pressure",
              value: "${weatherData.pressure} hpa",
            ),
            columnWidget(
              title: "Humidity",
              value: "${weatherData.humidity}%",
            ),
            columnWidget(
              title: "Wind Speed",
              value: "${weatherData.windSpeed} m/s",
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

Widget columnWidget({required String title, required String value}) {
  return Column(
    children: [
      Text(
        title,
        style: AppTextStyles.buttonStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        value,
        style: AppTextStyles.buttonStyle.copyWith(
          color: Colors.grey,
        ),
      ),
    ],
  );
}
