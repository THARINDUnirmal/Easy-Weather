import 'package:flowx/services/theme_preferences_services.dart';
import 'package:flowx/utils/app_theme_data.dart';
import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  ThemeData _theme = AppThemeData.lightTheme;
  ThemeDataProvider() { _loadTheme(); }
  ThemeData get getTheme => _theme;

  void _apply(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final dark = await ThemePreferencesServices().getSavedPreferences();
    _apply(dark ? AppThemeData.darckTheme : AppThemeData.lightTheme);
  }

  Future<void> toggelTheme(bool isDark) async {
    _apply(isDark ? AppThemeData.darckTheme : AppThemeData.lightTheme);
    await ThemePreferencesServices().savePreferenses(isDark);
  }
}
