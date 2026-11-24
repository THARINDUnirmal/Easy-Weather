import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferencesServices {
  Future<void> savePreferenses(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDark', isDark);
  }
  Future<bool> getSavedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isDark') ?? false;
  }
}
