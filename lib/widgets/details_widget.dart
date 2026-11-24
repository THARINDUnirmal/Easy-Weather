import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/utils/lottie_animation_function.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsWidget extends StatelessWidget {
  final OpenWeatherModel weatherData;
  const DetailsWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final condition = weatherData.mainCondition;
    final iconPath = LottieAnimationFunction().lottieMethord(condition);
    final desc = weatherData.description.isNotEmpty
        ? '${weatherData.description[0].toUpperCase()}${weatherData.description.substring(1)}'
        : condition;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4E9AF8), Color(0xFF2868D9), Color(0xFF2451B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF347FE9).withOpacity(.22),
                blurRadius: 25,
                offset: const Offset(0, 12))
          ],
        ),
        child: Stack(children: [
          Positioned(
              right: -16,
              top: -18,
              child: Icon(Icons.cloud_rounded,
                  size: 110, color: Colors.white.withOpacity(.08))),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.location_on_rounded,
                  color: Colors.white70, size: 18),
              const SizedBox(width: 5),
              Flexible(
                  child: Text(weatherData.cityName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700))),
            ]),
            SizedBox(height: 6),
            Text('CURRENT WEATHER',
                style: TextStyle(
                    color: Colors.white.withOpacity(.65),
                    fontSize: 10,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 2),
            SizedBox(
                height: 165,
                child: Lottie.asset(iconPath, fit: BoxFit.contain)),
            Text('${weatherData.temp.round()}°',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 76,
                    height: .95,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -4)),
            const SizedBox(height: 8),
            Text(desc,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text('Feels like ${weatherData.temp.round()}°C',
                style: TextStyle(
                    color: Colors.white.withOpacity(.7), fontSize: 13)),
          ]),
        ]),
      ),
      const SizedBox(height: 22),
      Text('Weather details',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface)),
      const SizedBox(height: 12),
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.65,
        children: [
          _MetricCard(
              icon: Icons.water_drop_rounded,
              title: 'Humidity',
              value: '${weatherData.humidity.round()}%',
              dark: dark),
          _MetricCard(
              icon: Icons.air_rounded,
              title: 'Wind speed',
              value: '${weatherData.windSpeed.toStringAsFixed(1)} m/s',
              dark: dark),
          _MetricCard(
              icon: Icons.speed_rounded,
              title: 'Pressure',
              value: '${weatherData.pressure.round()} hPa',
              dark: dark),
          _MetricCard(
              icon: Icons.thermostat_rounded,
              title: 'Temperature',
              value: '${weatherData.temp.round()} °C',
              dark: dark),
        ],
      ),
    ]);
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool dark;
  const _MetricCard(
      {required this.icon,
      required this.title,
      required this.value,
      required this.dark});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: dark ? const Color(0xFF1B2634) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: dark
                  ? Colors.white.withOpacity(.04)
                  : const Color(0xFFE6ECF5)),
          boxShadow: dark
              ? null
              : [
                  BoxShadow(
                      color: const Color(0xFF173A66).withOpacity(.04),
                      blurRadius: 14,
                      offset: const Offset(0, 5))
                ],
        ),
        child: Row(children: [
          Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  color: const Color(0xFF438CF5).withOpacity(.12),
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: const Color(0xFF438CF5), size: 22)),
          const SizedBox(width: 11),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 11,
                        color: dark ? Colors.white54 : const Color(0xFF8B98AA),
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w800)),
              ])),
        ]),
      );
}
