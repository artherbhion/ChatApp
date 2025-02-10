import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      brightness: Brightness.light,
      primary: Colors.grey.shade500,
      secondary: Color.fromARGB(255, 198, 197, 197),
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900),
);
