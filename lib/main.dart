import 'package:flutter/material.dart';
import 'package:islami/providers/language_provider.dart';
import 'package:islami/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'my_app/my_app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..getTheme(),
    ),
    ChangeNotifierProvider(
      create: (context) => LanguageProvider()..getLang(),
    ),
  ], child: const MyApp()));
}