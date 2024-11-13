import 'package:flutter/material.dart';

import '../../../../../../core/colors_manager.dart';
import '../../../../../../core/strings_manager.dart';

class HadithHeaderWidget extends StatelessWidget {
  const HadithHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: ColorsManager.goldColor, width: 3))),
        child: Text(
          StringsManager.elhadithLabel,
          style: Theme.of(context).textTheme.labelMedium,
        ));
  }
}
