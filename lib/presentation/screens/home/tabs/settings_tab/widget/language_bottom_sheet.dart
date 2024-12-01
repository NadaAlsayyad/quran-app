import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                myProvider.changeAppLang('en');
              },
              child: myProvider.currentLang == 'en'
                  ? buildSelectedLanguage(context, "English")
                  : buildUnSelectedLanguage(context, 'English')),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                myProvider.changeAppLang('ar');
              },
              child: myProvider.currentLang == 'ar'
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
        Spacer(),
        Icon(Icons.check)
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
