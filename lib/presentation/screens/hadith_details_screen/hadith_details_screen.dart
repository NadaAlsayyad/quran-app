import 'package:flutter/material.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';

import '../../../core/assets_manager.dart';
import '../../../core/strings_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadith hadith = ModalRoute.of(context)?.settings.arguments as Hadith;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsManager.lightBG,
              ))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.appTitle),
        ),
        body: Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                hadith.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                color: Theme.of(context).dividerColor,
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 35),
              ),
              Text(
                hadith.content,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ]),
          ),
        )),
      ),
    );
  }
}
