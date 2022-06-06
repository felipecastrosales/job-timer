import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();

  static const MaterialColor primarySwatch = MaterialColor(
    0xff0066b0,
    <int, Color>{
      50: Color(0xFF005c9e),
      100: Color(0xFF00528d),
      200: Color(0xFF00477b),
      300: Color(0xFF003d6a),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001f35),
      700: Color(0xFF001423),
      800: Color(0xFF000a12),
      900: Color(0xFF000000),
    },
  );

  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xff0066b0),
    primaryColorLight: const Color(0xff219fff),
    primarySwatch: primarySwatch,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      labelStyle: const TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
