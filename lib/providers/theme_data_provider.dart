import 'package:flowx/utils/app_theme_data.dart';
import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  final _theme = AppThemeData.lightTheme;

  //getter
  ThemeData get getTheme => _theme;
}
