import 'package:flutter/cupertino.dart';
import 'package:islami/providers/quran_provider.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/hadith_details_screen/hadith_details_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/quran_details_screen/quran_details_screen.dart';
import '../presentation/splash/splash_screen.dart';

class RoutesManager {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String quranDetailsRoute = '/quranDetails';
  static const String hadithDetailsRoute = '/hadithDetails';

  static Map<String, WidgetBuilder> routes = {
    RoutesManager.splashRoute: (_) => const SplashScreen(),
    RoutesManager.homeRoute: (_) => const HomeScreen(),
    RoutesManager.quranDetailsRoute: (_) => ChangeNotifierProvider(
        create: (context) => QuranProvider(),
        child: const QuranDetailsScreen()),
    RoutesManager.hadithDetailsRoute: (_) => const HadithDetailsScreen(),
  };
}
