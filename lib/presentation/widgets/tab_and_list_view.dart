import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_20_3/routes.dart';
import '../../core/widgets/my_tab_view.dart';
import '../../data/cubits/quran_cubit/quran_cubit.dart';
import 'juzaas_list_view.dart';
import 'surahs_list_view.dart';

class TabAndListView extends StatefulWidget {
  const TabAndListView({Key? key}) : super(key: key);

  @override
  State<TabAndListView> createState() => _TabAndListViewState();
}

class _TabAndListViewState extends State<TabAndListView> {
  ValueNotifier<String> tabController = ValueNotifier("1");
  @override
  void initState() {
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranCubit>.value(
      value: quranCubit!,
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          var cubit = QuranCubit.get(context);
          return cubit.pages.isNotEmpty &&
                  cubit.juzaas.isNotEmpty &&
                  cubit.surahs.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTabView(
                          controller: tabController,
                          segments: const {"1": "السور", "2": "الاجزاء"},
                        ),
                      ),
                    ),
                    (tabController.value == "1"
                        ? Expanded(
                            flex: 10,
                            child: SurahsListView(surahsList: cubit.surahs))
                        : Expanded(
                            flex: 10,
                            child: JuzaasListView(juzaasList: cubit.juzaas),
                          ))
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
        },
      ),
    );
  }
}
