import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/services/weather_services.dart';
import 'package:flowx/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SerchLocationPage extends StatefulWidget {
  const SerchLocationPage({super.key});
  @override
  State<SerchLocationPage> createState() => _SerchLocationPageState();
}

class _SerchLocationPageState extends State<SerchLocationPage> {
  final WeatherServices _weatherServices = WeatherServices(apiKey: dotenv.env['OPEN_WEATHER_API_KEY'] ?? '');
  final TextEditingController _controller = TextEditingController();
  OpenWeatherModel? _weather;
  String? _error;
  bool _loading = false;

  Future<void> _searchWeather() async {
    final city = _controller.text.trim();
    if (city.isEmpty) {
      setState(() { _error = 'Enter a city name to search.'; _weather = null; });
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() { _loading = true; _error = null; _weather = null; });
    try {
      final result = await _weatherServices.getWeatherFromCityName(city);
      if (!mounted) return;
      setState(() { _weather = result; _loading = false; });
    } catch (_) {
      if (!mounted) return;
      setState(() { _error = 'We couldn’t find weather for “$city”. Check the spelling and try again.'; _loading = false; });
    }
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: dark ? const Color(0xFF101821) : const Color(0xFFF2F6FC),
      appBar: AppBar(
        backgroundColor: dark ? const Color(0xFF101821) : const Color(0xFFF2F6FC),
        title: const Text('City search', style: TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: dark ? const Color(0xFF1B2634) : Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Find a city', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text('Get current weather conditions anywhere.', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(.6), fontSize: 13)),
              const SizedBox(height: 18),
              TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _searchWeather(),
                decoration: InputDecoration(
                  hintText: 'e.g. Colombo, London, Tokyo',
                  prefixIcon: const Icon(Icons.location_city_rounded, color: Color(0xFF438CF5)),
                  suffixIcon: IconButton(onPressed: _controller.clear, icon: const Icon(Icons.close_rounded)),
                  filled: true,
                  fillColor: dark ? const Color(0xFF101821) : const Color(0xFFF2F6FC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(width: double.infinity, height: 52, child: FilledButton(
                onPressed: _loading ? null : _searchWeather,
                style: FilledButton.styleFrom(backgroundColor: const Color(0xFF438CF5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                child: _loading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Search weather', style: TextStyle(fontWeight: FontWeight.w700)),
              )),
            ]),
          ),
          if (_error != null) ...[
            const SizedBox(height: 18),
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFFFE9E9), borderRadius: BorderRadius.circular(18)),
              child: Row(children: [const Icon(Icons.info_outline, color: Colors.redAccent), const SizedBox(width: 10), Expanded(child: Text(_error!, style: const TextStyle(color: Color(0xFF9F2B2B))))])),
          ],
          if (_weather != null) ...[
            const SizedBox(height: 22),
            DetailsWidget(weatherData: _weather!),
          ],
          if (!_loading && _weather == null && _error == null) ...[
            const SizedBox(height: 36),
            Icon(Icons.travel_explore_rounded, size: 58, color: const Color(0xFF438CF5).withOpacity(.5)),
            const SizedBox(height: 12),
            Text('Your city weather will appear here', textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(.5))),
          ]
        ],
      )),
    );
  }
}
