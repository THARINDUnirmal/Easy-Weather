import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  //light mode theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffffffff),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Color(0xffffffff),
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  //dark mode theme
  static ThemeData darckTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff151515),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color(0xff151515),
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
