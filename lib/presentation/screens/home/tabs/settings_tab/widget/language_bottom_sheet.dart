import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedLanguage(context, 'English'),
          const SizedBox(
            height: 10,
          ),
          buildUnSelectedLanguage(context, 'Arabic')
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
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
