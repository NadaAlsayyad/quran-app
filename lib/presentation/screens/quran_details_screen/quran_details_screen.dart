import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/presentation/screens/quran_details_screen/widgets/sura_verses_widget.dart';
import 'package:islami/providers/quran_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class QuranDetailsScreen extends StatelessWidget {
  const QuranDetailsScreen({super.key});

  //List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    var quranProvider = Provider.of<QuranProvider>(context);
    SuraItem suraItem = ModalRoute.of(context)?.settings.arguments as SuraItem;
    if (quranProvider.verses.isEmpty)
      quranProvider.readQuranFile(suraItem.index + 1);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                themeProvider.isLightTheme()
                    ? AssetsManager.lightBG
                    : AssetsManager.darkBG,
              ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(suraItem.suraName),
        ),
        body: quranProvider.verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) =>
                    SuraVersesWidget(verses: quranProvider.verses[index]),
                itemCount: quranProvider.verses.length,
              ),
      ),
    );
  }
}
