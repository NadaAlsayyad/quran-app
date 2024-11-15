import 'package:flutter/material.dart';
import 'package:islami/core/colors_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.goldColor,
    //useMaterial3: true,
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
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      color: ColorsManager.goldColor.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 14,
    ),
    dividerColor: const Color(0xFFB7935F),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF242424)),
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Color(0xFF242424)),
      bodyMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
    ),
  );
}
