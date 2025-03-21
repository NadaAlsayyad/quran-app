import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami/providers/hadith_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    ChangeNotifierProvider(
        create: (context) => HadithProvider(), child: const HadithTab()),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        Image.asset(
          themeProvider.isLightTheme()
              ? AssetsManager.lightBG
              : AssetsManager.darkBG,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.titleApp),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            // callback function
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsManager.quranIcon)),
                  label: AppLocalizations.of(context)!.quranTab),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsManager.hadithIcon)),
                  label: AppLocalizations.of(context)!.hadithTab),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsManager.sebhaIcon)),
                  label: AppLocalizations.of(context)!.sebhaTab),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AssetsManager.radioIcon)),
                  label: AppLocalizations.of(context)!.radioTab),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settingsTab),
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
