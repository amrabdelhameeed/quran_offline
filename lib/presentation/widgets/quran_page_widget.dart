import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_20_3/core/constants/strings.dart';
import 'package:quran_20_3/core/utils/size_config.dart';
import 'package:quran_20_3/data/cubits/quran_cubit/quran_cubit.dart';
import 'package:quran_20_3/routes.dart';

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              index == 0 || index == 1
                  ? Theme.of(context).textTheme.subtitle1!.color!
                  : Theme.of(context).textTheme.bodyText1!.color!,
              BlendMode.srcIn),
          child: Image.asset(
            pagesText[index],
            fit: BoxFit.fill,
            height: screen.size.height,
          ),
        ),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyText1!.color!, BlendMode.srcIn),
          child: Image.asset(
            pagesBorder[index],
            fit: BoxFit.fill,
            height: screen.size.height,
          ),
        ),
        (index != 0 && index != 1)
            ? index % 2 != 0
                ? Positioned(
                    left: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screen.size.height,
                          width: 2,
                          color: Colors.grey,
                        ),
                        Container(
                          height: screen.size.height,
                          width: 3,
                          margin: const EdgeInsets.only(left: 5),
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                : Positioned(
                    right: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screen.size.height,
                          width: 3,
                          color: Colors.grey,
                        ),
                        Container(
                          height: screen.size.height,
                          width: 2,
                          margin: const EdgeInsets.only(left: 5),
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
            : Container(),
        index % 2 == 0
            ? BlocProvider<QuranCubit>.value(
                value: quranCubit!,
                child: pageNumberCashed! - 1 == index
                    ? Positioned(
                        top: SizeConfig.defaultSize! * 5,
                        left: 0.0,
                        child: Image.asset(
                          "lib/assets/bookmark.png",
                          width: SizeConfig.defaultSize! * 2,
                          height: screen.size.height - screen.viewPadding.top,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              )
            : BlocProvider<QuranCubit>.value(
                value: quranCubit!,
                child: pageNumberCashed! - 1 == index
                    ? Positioned(
                        top: SizeConfig.defaultSize! * 5,
                        right: 0.0,
                        child: Image.asset(
                          "lib/assets/bookmark.png",
                          width: SizeConfig.defaultSize! * 2,
                          height: screen.size.height - screen.viewPadding.top,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              ),
      ],
    );
  }
}
