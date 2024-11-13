import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/core/strings_manager.dart';

import '../home/tabs/hadith_tab/hadith_tab.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadith hadith = ModalRoute.of(context)?.settings.arguments as Hadith;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AssetsManager.lightBG))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.appTitle),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    hadith.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    color: Colors.white,
                    height: 1.0,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                  ),
                  Text(
                    hadith.content,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
