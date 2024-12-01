import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/settings_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                myProvider.chaneAppTheme(ThemeMode.light);
              },
              child: myProvider.currentTheme == ThemeMode.light
                  ? buildSelectedThemeWidget(
                      context, AppLocalizations.of(context)!.light)
                  : buildUnSelectedThemeWidget(
                      context, AppLocalizations.of(context)!.light)),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              myProvider.chaneAppTheme(ThemeMode.dark);
            },
            child: myProvider.currentTheme == ThemeMode.dark
                ? buildSelectedThemeWidget(
                    context, AppLocalizations.of(context)!.dark)
                : buildUnSelectedThemeWidget(
                    context, AppLocalizations.of(context)!.dark),
          )
        ],
      ),
    );
  }

  Widget buildSelectedThemeWidget(BuildContext context, String selectedTheme) {
    return Row(
      children: [
        Text(
          selectedTheme,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Spacer(),
        Icon(Icons.check)
      ],
    );
  }

  Widget buildUnSelectedThemeWidget(
      BuildContext context, String selectedUnTheme) {
    return Row(
      children: [
        Text(
          selectedUnTheme,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
