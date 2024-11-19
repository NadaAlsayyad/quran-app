import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedThemeWidget(context, 'Light'),
          const SizedBox(
            height: 10,
          ),
          buildUnSelectedThemeWidget(context, 'Dark')
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
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
