import 'package:flowx/pages/home_page.dart';
import 'package:flowx/providers/theme_data_provider.dart';
import 'package:flowx/utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.darckTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
