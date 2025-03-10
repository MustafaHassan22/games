import 'package:flutter/material.dart';

class AppTheme {
  // static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: color,
  //         width: 3,
  //       ),
  //       borderRadius: BorderRadius.circular(10),
  //     );
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: const Color.fromARGB(255, 5, 150, 235),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 5, 150, 235),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 5, 150, 235),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 5, 150, 235),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: const TextTheme());
  }
}
