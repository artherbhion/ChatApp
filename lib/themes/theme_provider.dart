import 'package:flutter/material.dart';
import 'package:arther_chat_app/themes/dark_mode.dart';
import 'package:arther_chat_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode; // Default to dark mode

  // Getter for the current theme data
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  // Setter for theme data
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Method to toggle between light and dark mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
