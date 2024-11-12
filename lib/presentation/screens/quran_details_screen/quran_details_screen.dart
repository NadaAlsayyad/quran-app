import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/assets_manager.dart';
import 'package:islami/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/presentation/screens/quran_details_screen/widgets/sura_verses_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraItem suraItem = ModalRoute.of(context)?.settings.arguments as SuraItem;
    if (verses.isEmpty) readQuranFile(suraItem.index + 1);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsManager.lightBG,
              ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(suraItem.suraName),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) =>
                    SuraVersesWidget(verses: verses[index]),
                itemCount: verses.length,
              ),
      ),
    );
  }

  void readQuranFile(int index) async {
    // read sura content
    // rootBundle : package that read string => text file
    String fileContent = await rootBundle.loadString('assets/files/$index.txt');
    verses = fileContent
        .trim()
        .split('\n'); // verses not empty so it will be setState
    // verses.forEach((element) {
    //   print(element);
    // },);
    setState(() {});
  }
}
