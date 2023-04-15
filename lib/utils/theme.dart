import 'package:flutter/material.dart';

class T1 {
  static ThemeData themeData() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
