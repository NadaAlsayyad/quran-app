import 'package:flutter/material.dart';

class SuraVersesWidget extends StatelessWidget {
  SuraVersesWidget({super.key, required this.verses});

  String verses;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 14,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Text(verses,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
