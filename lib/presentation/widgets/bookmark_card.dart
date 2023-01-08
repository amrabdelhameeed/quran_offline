import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_20_3/core/widgets/space.dart';
import '../../core/constants/strings.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/size_config.dart';
import '../../data/cubits/quran_cubit/quran_cubit.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        var cubit = QuranCubit.get(context);
        if (cubit.pageNumberNames == null &&
            cubit.pages.isNotEmpty &&
            pageNumberCashed != -1) {
          cubit.getSurahsNameOfBookmark(pageNumberCashed! - 1);
        }
        return GestureDetector(
          onTap: () {
            if (pageNumberCashed != -1) {
              Navigator.pushNamed(context, quranScreen,
                  arguments: pageNumberCashed! - 1);
            }
          },
          child: Stack(
            children: [
              Container(
                height: SizeConfig.defaultSize! * 15.5,
                width: SizeConfig.screenWidth!,
                padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 12),
                margin:
                    EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
                decoration: BoxDecoration(
                  color: AppColors.goldenColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                          image: AssetImage(AppImages.quranImage))),
                ),
              ),
              pageNumberCashed != -1 && cubit.pageNumberNames != null
                  ? Positioned(
                      left: SizeConfig.defaultSize! * 2.4,
                      top: SizeConfig.defaultSize! * 1.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.bookmark),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "موضع العلامة",
                                  textScaleFactor: 0.9,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "سورة ${cubit.pageNumberNames}",
                                  textScaleFactor: 0.9,
                                ),
                              ),
                              const VerticalSpace(
                                value: 1,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "صفحة : $pageNumberCashed",
                                  textScaleFactor: 0.9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                  : cubit.pageNumberNames == null && pageNumberCashed == -1
                      ? Positioned(
                          left: SizeConfig.defaultSize! * 2.4,
                          top: SizeConfig.defaultSize! * 1.4,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Container(
                              height: SizeConfig.defaultSize! * 15,
                              padding: EdgeInsets.only(
                                  left: SizeConfig.defaultSize! * 2),
                              width: SizeConfig.defaultSize! * 15,
                              child: const Text(
                                "اضغط ضغطة مطولة علي صفحة القران لحفظ العلامة",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 0.8,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin:
                              EdgeInsets.only(top: SizeConfig.defaultSize! * 3),
                          child: Center(
                            child: CircularProgressIndicator(
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                            ),
                          ),
                        )
            ],
          ),
        );
      },
    );
  }
}
