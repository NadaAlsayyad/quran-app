import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'my_app/my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), // singleton instance
      child: const MyApp()));
}
