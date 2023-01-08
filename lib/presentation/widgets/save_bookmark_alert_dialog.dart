import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_20_3/data/cubits/quran_cubit/quran_cubit.dart';
import 'package:quran_20_3/routes.dart';

class SaveBookmarkAlertDialog extends StatelessWidget {
  const SaveBookmarkAlertDialog({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "حفظ العلامة في هذه الصفحة ؟",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            child: Text(
              "لا",
              style: Theme.of(context).textTheme.subtitle2,
            )),
        BlocProvider<QuranCubit>.value(
          value: quranCubit!,
          child: BlocConsumer<QuranCubit, QuranState>(
            listener: (context, state) {
              if (state is OnBookmarkSavedState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              var cubit = QuranCubit.get(context);
              return TextButton(
                  onPressed: () {
                    cubit.setPageNumber(index);
                  },
                  child: Text(
                    "نعم",
                    style: Theme.of(context).textTheme.subtitle2,
                  ));
            },
          ),
        )
      ],
    );
  }
}
