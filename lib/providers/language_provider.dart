import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLang = 'en';

  void changeAppLang(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    saveLanguage(newLang);
    notifyListeners();
  }

  bool isEnglish() {
    return currentLang == 'en';
  }

  void saveLanguage(String recentLang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (recentLang == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  void getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLang = prefs.getString('language') ?? 'en';
    notifyListeners();
  }
}
