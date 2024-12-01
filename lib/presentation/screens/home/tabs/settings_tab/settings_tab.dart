import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/widget/language_bottom_sheet.dart';
import 'package:islami/presentation/screens/home/tabs/settings_tab/widget/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/settings_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
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
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                    myProvider.isLightTheme()
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.headlineSmall)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.language,
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
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                    myProvider.currentLang == 'en' ? "English" : "العربية",
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
