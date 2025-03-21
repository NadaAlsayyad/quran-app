import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/radio_tab/widgets/radio_item_widget.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AssetsManager.radio),
          const RadioItemWidget(),
        ],
      ),
    );
  }
}
