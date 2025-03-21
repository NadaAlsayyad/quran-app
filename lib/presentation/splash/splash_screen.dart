import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/core/routes_manager.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
        }
      },
    );
    return Container(
      child: Image.asset(
        themeProvider.isLightTheme()
            ? AssetsManager.lightSplash
            : AssetsManager.darkSplash,
        fit: BoxFit.fill,
      ),
    );
  }
}
