import 'package:flutter/material.dart';
import 'package:islami/core/routes_manager.dart';

import '../quran_tab.dart';

class QuranItemWidget extends StatelessWidget {
  SuraItem suraItem;

  QuranItemWidget({super.key, required this.suraItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.quranDetailsRoute,
          arguments: suraItem,
        );
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(suraItem.suraName,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center),
            )),
            VerticalDivider(
              color: (Theme.of(context).dividerColor),
              width: 3,
              thickness: 3,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                suraItem.versesNumber,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
