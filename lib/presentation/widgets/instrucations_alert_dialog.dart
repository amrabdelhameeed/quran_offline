import 'package:flutter/material.dart';
import 'package:quran_20_3/core/constants/strings.dart';
import 'package:quran_20_3/core/utils/cashe_helper.dart';

class InstrucationsAlertDialog extends StatelessWidget {
  const InstrucationsAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          "اضغط مرتين علي صفحة القران لتشغيل قراءة الصفحة",
          textScaleFactor: 0.8,
          maxLines: 3,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              isOnDoubleTapInfoDismmised = true;
              CasheHelper.setBoolean(
                      key: cahseKeyForisOnDoubleTapInfoDismmised, boolean: true)
                  .then((value) => Navigator.pop(context));
            },
            child: Text(
              "حسنا و عدم الاظهار مرة اخري",
              textScaleFactor: 0.9,
              style: Theme.of(context).textTheme.subtitle2,
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "حسنا",
              textScaleFactor: 0.9,
              style: Theme.of(context).textTheme.subtitle2,
            )),
      ],
    );
  }
}
