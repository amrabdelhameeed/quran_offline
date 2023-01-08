// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:quran_20_3/presentation/widgets/quran_page_widget.dart';
import 'package:quran_20_3/presentation/widgets/save_bookmark_alert_dialog.dart';
import '../../core/utils/app_images.dart';
import '../../core/constants/strings.dart';

class QuranPageView extends StatelessWidget {
  QuranPageView({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  int currentPage = -1;
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      color: Theme.of(context).primaryColor,
      height: screen.size.height,
      child: SafeArea(
        child: PageView.builder(
          itemCount: pagesBorder.length,
          reverse: true,
          controller: pageController,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SaveBookmarkAlertDialog(
                      index: index,
                    );
                  },
                );
              },
              onDoubleTap: () {
                if (currentPage == index) {
                  assetsAudioPlayer.playOrPause();
                } else {
                  assetsAudioPlayer
                      .open(
                          Audio.network(pagesMp3url[index],
                              metas: Metas(
                                  image: const MetasImage.asset(
                                      AppImages.liveStream),
                                  artist: "قيد التشغيل الان",
                                  title: "صفحة : ${index + 1}")),
                          showNotification: true,
                          playInBackground: PlayInBackground.enabled,
                          notificationSettings: const NotificationSettings(
                              nextEnabled: false,
                              prevEnabled: false,
                              playPauseEnabled: true,
                              stopEnabled: true))
                      .catchError((onError) => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Directionality(
                            textDirection: TextDirection.rtl,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child:
                                  Text("لا يوجد اتصال بالانترنت لتشغيل الصفحة"),
                            ),
                          ))));
                }
                currentPage = index;
              },
              child: QuranPageWidget(index: index),
            );
          },
        ),
      ),
    );
  }
}
