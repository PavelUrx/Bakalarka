import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 60, 70, 68),
        appBarTheme: const AppBarTheme(color: Colors.teal),
        fontFamily: GoogleFonts.righteous().fontFamily,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 60, 70, 68)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal))));
  }
}
