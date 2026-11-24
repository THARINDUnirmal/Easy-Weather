import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static const Color accent = Color(0xFF438CF5);
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.light),
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF2F6FC),
    appBarTheme: const AppBarTheme(
      foregroundColor: Color(0xFF182338),
      backgroundColor: Color(0xFFF2F6FC),
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(color: Color(0xFF182338), fontSize: 21, fontWeight: FontWeight.w800),
    ),
  );
  static ThemeData darckTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark),
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF101821),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF101821),
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w800),
    ),
  );
}
