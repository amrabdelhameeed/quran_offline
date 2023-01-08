import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/size_config.dart';
import '../../data/models/surah.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({Key? key, required this.onTap, required this.surahModel})
      : super(key: key);
  final VoidCallback onTap;
  final Surah surahModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          onTap: onTap,
          leading: Container(
            height: SizeConfig.defaultSize! * 3.9,
            width: SizeConfig.defaultSize! * 3.9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      AppImages.starImage,
                    ),
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyText1!.color!,
                        BlendMode.srcIn))),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Center(
                  child: Text(
                int.parse(surahModel.index).toString(),
                textScaleFactor: 0.95,
                style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.1),
              )),
            ),
          ),
          title: FittedBox(
              alignment: Alignment.topRight,
              fit: BoxFit.scaleDown,
              child: Text(surahModel.titleAr)),
          subtitle: FittedBox(
            alignment: Alignment.topRight,
            fit: BoxFit.scaleDown,
            child: Text(
              "${surahModel.place} .  ${surahModel.count.round()} verses",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          trailing: FittedBox(
            alignment: Alignment.topLeft,
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: SizeConfig.screenWidth! / 2,
              child: Text(
                surahModel.titleEn,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: SizeConfig.defaultSize! * 2.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
