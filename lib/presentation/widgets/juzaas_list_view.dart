import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_20_3/core/utils/size_config.dart';
import '../../core/constants/strings.dart';
import '../../data/cubits/quran_cubit/quran_cubit.dart';
import '../../data/models/juzaa.dart';
import 'juzaa_item.dart';

class JuzaasListView extends StatelessWidget {
  const JuzaasListView({Key? key, required this.juzaasList}) : super(key: key);
  final List<Juzaa> juzaasList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        var cubit = QuranCubit.get(context);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: juzaasList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return JuzaaItem(
              onTap: () {
                Navigator.pushNamed(context, quranScreen,
                    arguments: cubit.getPageOfJuzaa(juzaasList[index]));
              },
              juzaaModel: juzaasList[index],
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
              height: SizeConfig.defaultSize! / 10,
              width: double.infinity,
              color: Colors.grey,
            );
          },
        );
      },
    );
  }
}
