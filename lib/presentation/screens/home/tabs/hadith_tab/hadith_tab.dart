import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/widgets/hadith_header_widget.dart';
import 'package:islami/presentation/screens/home/tabs/hadith_tab/widgets/hadith_title_widget.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> allHadithList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadithList.isEmpty) loadHadithFile();
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image(image: AssetImage(AssetsManager.hadithHeaderImage))),
          HadithHeaderWidget(),
          Expanded(
            flex: 3,
            child: allHadithList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => HadithTitleWidget(
                          hadith: allHadithList[index],
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 3,
                        ),
                    itemCount: allHadithList.length),
          ),
        ],
      ),
    );
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithList = fileContent.trim().split('#');
    for (int i = 0; i < hadithList.length; i++) {
      String hadithItem = hadithList[i];
      List<String> hadithLines =
          hadithItem.trim().split('\n'); // split hadith to lines
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join('\n');
      Hadith hadith = Hadith(title: title, content: content);
      allHadithList.add(hadith);
    }
    setState(() {});
// hadithLines.forEach((lines) {
//   print(lines);
// });
  }
}

class Hadith {
  String title;
  String content;

  Hadith({required this.title, required this.content});
}