import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        AssetsManager.lightSplash,
        fit: BoxFit.fill,
      ),
    );
  }
}
