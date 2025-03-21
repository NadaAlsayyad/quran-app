import 'package:flutter/material.dart';
import 'package:islami/providers/radio_provider.dart';
import 'package:provider/provider.dart';

class RadioItemWidget extends StatelessWidget {
  const RadioItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RadioProvider()..getRadioList(),
      builder: (context, child) {
        var radioProvider = Provider.of<RadioProvider>(context);
        if (radioProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Text(
              radioProvider.radioList[radioProvider.currentIndex].name ?? '',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      radioProvider.prev();
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      // color: Theme.of(context).colorScheme,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () {
                      radioProvider.play();
                    },
                    icon: Icon(
                      !radioProvider.isPlaying ? Icons.play_arrow : Icons.pause,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () {
                      radioProvider.next();
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 35,
                    )),
              ],
            )
          ],
        );
      },
    );
  }
}
