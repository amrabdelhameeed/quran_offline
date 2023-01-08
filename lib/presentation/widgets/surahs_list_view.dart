import 'package:flutter/material.dart';
import '../../data/models/surah.dart';
import '../../core/constants/strings.dart';
import 'surah_item.dart';

class SurahsListView extends StatelessWidget {
  const SurahsListView({Key? key, required this.surahsList}) : super(key: key);
  final List<Surah> surahsList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: surahsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SurahItem(
          onTap: () {
            Navigator.pushNamed(context, quranScreen,
                arguments: int.parse(surahsList[index].page) - 1);
          },
          surahModel: surahsList[index],
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        );
      },
    );
  }
}
