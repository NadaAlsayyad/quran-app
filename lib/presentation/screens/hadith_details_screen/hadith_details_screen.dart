import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manager.dart';
import '../../../providers/settings_provider.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);

    Hadith hadith = ModalRoute.of(context)?.settings.arguments as Hadith;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                myProvider.isLightTheme()
                    ? AssetsManager.lightBG
                    : AssetsManager.darkBG,
              ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.titleApp),
        ),
        body: Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                hadith.title,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Container(
                color: Theme.of(context).indicatorColor,
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
