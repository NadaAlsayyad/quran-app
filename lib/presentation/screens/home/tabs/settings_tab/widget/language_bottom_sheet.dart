import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/language_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //var myProvider = Provider.of<SettingsProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                languageProvider.changeAppLang('en');
              },
              child: languageProvider.currentLang == 'en'
                  ? buildSelectedLanguage(context, "English")
                  : buildUnSelectedLanguage(context, 'English')),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                languageProvider.changeAppLang('ar');
              },
              child: languageProvider.currentLang == 'ar'
                  ? buildSelectedLanguage(context, "العربية")
                  : buildUnSelectedLanguage(context, 'العربية'))
        ],
      ),
    );
  }

  Widget buildSelectedLanguage(BuildContext context, String selectedLanguage) {
    return Row(
      children: [
        Text(
          selectedLanguage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Spacer(),
        const Icon(Icons.check)
      ],
    );
  }

  Widget buildUnSelectedLanguage(
      BuildContext context, String unSelectedLanguage) {
    return Row(
      children: [
        Text(
          unSelectedLanguage,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
