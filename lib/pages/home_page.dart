import 'package:flowx/models/open_weather_model.dart';
import 'package:flowx/pages/serch_location_page.dart';
import 'package:flowx/providers/theme_data_provider.dart';
import 'package:flowx/services/weather_services.dart';
import 'package:flowx/widgets/details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherServices _weatherServices =
      WeatherServices(apiKey: dotenv.env['OPEN_WEATHER_API_KEY'] ?? '');
  OpenWeatherModel? _weatherData;
  bool _loading = true;
  String? _error;

  Future<void> apiCallData() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _weatherServices.getWeatherFromCurrentLocation();
      if (!mounted) return;
      setState(() {
        _weatherData = data;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error =
            'Unable to load your weather right now. Check location permission and internet.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apiCallData();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeProvider =
        Provider.of<ThemeDataProvider>(context, listen: false);
    final background =
        isDark ? const Color(0xFF101821) : const Color(0xFFF2F6FC);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        titleSpacing: 22,
        title: const Row(
          children: [
            Icon(Icons.cloud_rounded, color: Color(0xFF4B9BFF), size: 28),
            SizedBox(width: 9),
            Text('Easy Weather',
                style:
                    TextStyle(fontWeight: FontWeight.w800, letterSpacing: -.5)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: apiCallData,
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: () => themeProvider.toggelTheme(!isDark),
            icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const _LoadingView()
            : _error != null
                ? _ErrorView(message: _error!, onRetry: apiCallData)
                : _weatherData == null
                    ? _ErrorView(
                        message: 'Weather data is unavailable.',
                        onRetry: apiCallData)
                    : RefreshIndicator(
                        color: const Color(0xFF438CF5),
                        onRefresh: apiCallData,
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
                          children: [
                            Text('WEATHER TODAY',
                                style: TextStyle(
                                    color: isDark
                                        ? Colors.white54
                                        : const Color(0xFF8290A5),
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11)),
                            const SizedBox(height: 12),
                            DetailsWidget(weatherData: _weatherData!),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 58,
                              child: FilledButton.icon(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SerchLocationPage())),
                                icon: const Icon(Icons.search_rounded),
                                label: const Text('Explore another city',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16)),
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF438CF5),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Center(
                                child: Text('Pull down to refresh weather',
                                    style: TextStyle(
                                        color: isDark
                                            ? Colors.white38
                                            : Colors.black38,
                                        fontSize: 12))),
                          ],
                        ),
                      ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();
  @override
  Widget build(BuildContext context) => const Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 34,
              height: 34,
              child: CircularProgressIndicator(strokeWidth: 3)),
          SizedBox(height: 16),
          Text('Getting your weather…',
              style: TextStyle(fontWeight: FontWeight.w600))
        ],
      ));
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) => Center(
          child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: const Color(0xFF438CF5).withOpacity(.12),
                  shape: BoxShape.circle),
              child: const Icon(Icons.cloud_off_rounded,
                  size: 48, color: Color(0xFF438CF5))),
          const SizedBox(height: 18),
          const Text('Weather not available',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(.65))),
          const SizedBox(height: 22),
          FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again')),
        ]),
      ));
}
