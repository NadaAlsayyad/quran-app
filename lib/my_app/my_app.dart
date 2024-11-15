import 'package:flutter/material.dart';
import 'package:islami/config/theme/my_theme.dart';
import 'package:islami/core/routes_manager.dart';
import 'package:islami/presentation/screens/hadith_details_screen/hadith_details_screen.dart';

import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/quran_details_screen/quran_details_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.homeRoute: (_) => HomeScreen(),
        RoutesManager.quranDetailsRoute: (_) => QuranDetailsScreen(),
        RoutesManager.hadithDetailsRoute: (_) => HadithDetailsScreen(),
      },
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
