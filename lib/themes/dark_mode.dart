import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black87,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.orangeAccent.shade400, // Vibrant primary color
    secondary: Colors.grey.shade800, // Soft pastel yellow for contrast
    tertiary: Colors.orangeAccent.shade400, // Playful highlights
    inversePrimary: Colors.orangeAccent.shade400, // Warmer contrast for inverted elements
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontFamily: 'ComicSansMS', fontSize: 18, color: Color(0xFF000000)), // Softer white
    bodyMedium: TextStyle(fontFamily: 'ComicSansMS', fontSize: 16, color: Color(0xFFE0E0E0)), // Gentle contrast
    bodySmall: TextStyle(fontFamily: 'ComicSansMS', fontSize: 14, color: Color(0xFFBDBDBD)), // Slightly dimmed
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orangeAccent.shade200,
    titleTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'ComicSansMS'),
    elevation: 10,
    shadowColor: Colors.black38,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 8,
    shadowColor: Colors.black45,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade800, // Soft yellow button
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade800, // Soft pastel yellow
      foregroundColor: Colors.grey.shade900, // Dark gray text for contrast
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      shadowColor: Colors.orangeAccent.withOpacity(0.6), // Subtle glowing effect
    ),
  ),
);
