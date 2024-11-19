import 'package:flutter/material.dart';
import 'package:islami/core/colors_manager.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/widget/language_bottom_sheet.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/widget/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                //width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.goldColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Light',
                    style: Theme.of(context).textTheme.headlineSmall)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Language',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                //width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.goldColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('English',
                    style: Theme.of(context).textTheme.headlineSmall)),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    // any builder is function give context and return widget because it's build widget
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
