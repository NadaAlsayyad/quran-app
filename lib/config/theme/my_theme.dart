import 'package:flutter/material.dart';
import 'package:islami/core/colors_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Color(0xFF242424)),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.goldColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    dividerColor: const Color(0xFFB7935F),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF242424)),
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Color(0xFF242424)),
    ),
  );
}
