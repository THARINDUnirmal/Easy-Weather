import 'package:flowx/services/theme_preferences_services.dart';
import 'package:flowx/utils/app_theme_data.dart';
import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  ThemeData _theme = AppThemeData.lightTheme;
  ThemeDataProvider() {
    _loadTheme();
  }

  //getter
  ThemeData get getTheme => _theme;

  //setter
  set setThemeData(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final data = await ThemePreferencesServices().getSavedPreferences();
    setThemeData = data ? AppThemeData.darckTheme : AppThemeData.lightTheme;
  }

  Future<void> toggelTheme(bool isDark) async {
    setThemeData = isDark ? AppThemeData.darckTheme : AppThemeData.lightTheme;

    await ThemePreferencesServices().savePreferenses(isDark);
    notifyListeners();
  }
}
