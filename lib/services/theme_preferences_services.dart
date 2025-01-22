import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferencesServices {
  Future<void> savePreferenses(bool isDark) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isDark", isDark);
  }

  Future<bool> getSavePreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final data = pref.getBool("isDark");
    return data ?? false;
  }
}
