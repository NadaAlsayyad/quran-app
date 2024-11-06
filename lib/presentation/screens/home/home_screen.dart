import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/core/strings_manager.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/presentation/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    HadithTab(),
    QuranTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsManager.lightBG,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.appTitle),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            // callback function
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.radioIcon)),
                  label: StringsManager.radioLabel),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.sebhaIcon)),
                  label: StringsManager.sebhaLabel),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.hadithIcon)),
                  label: StringsManager.hadithLabel),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.quranIcon)),
                  label: StringsManager.quranLabel),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: StringsManager.settingLabel),
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
