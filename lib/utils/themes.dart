import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes
{
  static ThemeData themefun(bool isDarkTheme,BuildContext context)
  {
    if(isDarkTheme==true)
    {
      return darkTheme;
    }
    return lightTheme;
  }


  static final darkTheme=ThemeData
  (
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    fontFamily: GoogleFonts.lexendDeca().fontFamily,
    textTheme: TextTheme
    (
      titleLarge: GoogleFonts.lexendDeca
      (
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
      ),
      titleMedium: GoogleFonts.lexendDeca
      (
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
      titleSmall: GoogleFonts.lexendDeca
      (
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    )
  );

  static final lightTheme=ThemeData
  (
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    textTheme: TextTheme
    (
      titleLarge: GoogleFonts.lexendDeca
      (
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
      ),
      titleMedium: GoogleFonts.lexendDeca
      (
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
      titleSmall: GoogleFonts.lexendDeca
      (
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    )
  );


}