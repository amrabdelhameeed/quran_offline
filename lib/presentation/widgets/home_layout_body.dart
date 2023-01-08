import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/size_config.dart';
import '../../core/widgets/space.dart';
import '../../data/cubits/theme_cubit/theme_cubit.dart';
import 'bookmark_card.dart';
import 'tab_and_list_view.dart';

class HomeLayoutBody extends StatelessWidget {
  const HomeLayoutBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.defaultSize! * 15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: const DecorationImage(
                  image: AssetImage(
                    AppImages.backgroundImage,
                  ),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          appBar: AppBar(
            actions: [
              BlocConsumer<ThemeCubit, ThemeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = ThemeCubit.get(context);
                  return IconButton(
                      onPressed: () {
                        cubit.changeIsDark();
                      },
                      icon: Icon(
                          !cubit.isD! ? Icons.dark_mode : Icons.light_mode));
                },
              ),
            ],
            title: const Text(
              "Quran",
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: const [
                BookmarkCard(),
                VerticalSpace(
                  value: 1,
                ),
                Expanded(child: TabAndListView())
              ],
            ),
          ),
        )
      ],
    );
  }
}
