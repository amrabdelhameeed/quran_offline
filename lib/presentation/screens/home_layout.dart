import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import '../../core/utils/size_config.dart';
import '../widgets/home_layout_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () async {
          MoveToBackground.moveTaskToBack();
          return false;
        },
        child: const HomeLayoutBody());
  }
}
