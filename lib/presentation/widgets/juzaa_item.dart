import 'package:flutter/material.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/size_config.dart';
import '../../data/models/juzaa.dart';

class JuzaaItem extends StatelessWidget {
  const JuzaaItem({Key? key, required this.onTap, required this.juzaaModel})
      : super(key: key);
  final VoidCallback onTap;
  final Juzaa juzaaModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          onTap: onTap,
          title: Container(
            height: SizeConfig.defaultSize! * 7.5,
            width: SizeConfig.defaultSize! * 7.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      AppImages.starImage,
                    ),
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyText1!.color!,
                        BlendMode.srcIn))),
            child: Center(
                child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                int.parse(juzaaModel.index).toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
