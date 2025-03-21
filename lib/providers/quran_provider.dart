import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranProvider extends ChangeNotifier {
  List<String> verses = [];

  void readQuranFile(int index) async {
    // read sura content
    // rootBundle : package that read string => text file
    String fileContent = await rootBundle.loadString('assets/files/$index.txt');
    verses = fileContent
        .trim()
        .split('\n'); // verses not empty so it will be setState
    notifyListeners();
  }
}
