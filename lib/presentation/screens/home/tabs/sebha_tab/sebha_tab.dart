import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int tasbeehIndex = 0;
  double angle = 0;
  List<String> tsabeeh = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر'
  ];

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                themeProvider.isLightTheme()
                    ? AssetsManager.lightHeadSebha
                    : AssetsManager.darkHeadSebha,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.044),
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    height: size.height * 0.33,
                    themeProvider.isLightTheme()
                        ? AssetsManager.lightBodySebha
                        : AssetsManager.darkBodySebha,
                  ),
                ),
              ),
            ],
          ),
          Text(AppLocalizations.of(context)!.sebhaNumber,
              style: Theme.of(context).textTheme.labelMedium),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text('$counter',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const Spacer(
            flex: 1,
          ),
          InkWell(
            onTap: tasbeehCount,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tsabeeh[tasbeehIndex],
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  void tasbeehCount() {
    angle += 0.25;
    ++counter;
    if (counter > 33) {
      counter = 0;
      tasbeehIndex++;
      if (tasbeehIndex > 3) {
        tasbeehIndex = 0;
      }
    }
    // if (counter <33){
    // counter++;
    // }else{
    // counter = 0;
    // tasbeehIndex++;
    // if(tasbeehIndex == tsabeeh.length ){
    // tasbeehIndex =0;
    // }
    // }
    setState(() {});
  }
}
