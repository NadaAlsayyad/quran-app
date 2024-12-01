import 'package:flutter/material.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/widgets/hadith_header_widget.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/widgets/hadith_title_widget.dart';
import 'package:islami/providers/hadith_provider.dart';
import 'package:provider/provider.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  //List<Hadith> allHadithList = [];
  @override
  Widget build(BuildContext context) {
    var hadithProvider = Provider.of<HadithProvider>(context);
    if (hadithProvider.allHadithList.isEmpty) hadithProvider.loadHadithFile();
    return Container(
      child: Column(
        children: [
          const Expanded(
              flex: 2,
              child: Image(image: AssetImage(AssetsManager.hadithHeaderImage))),
          const HadithHeaderWidget(),
          Expanded(
            flex: 3,
            child: hadithProvider.allHadithList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => HadithTitleWidget(
                          hadith: hadithProvider.allHadithList[index],
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 3,
                        ),
                    itemCount: hadithProvider.allHadithList.length),
          ),
        ],
      ),
    );
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}