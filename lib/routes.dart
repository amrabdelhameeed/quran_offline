import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/strings.dart';
import 'data/cubits/quran_cubit/quran_cubit.dart';
import 'data/json_reader/json_reader.dart';
import 'data/repository/json_repository.dart';
import 'presentation/screens/home_layout.dart';
import 'presentation/screens/quran_screen.dart';

QuranCubit? quranCubit;

class AppRouter {
  AppRouter() {
    quranCubit = QuranCubit(JsonRepository(JsonReader()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeLayout:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<QuranCubit>.value(
              value: quranCubit!
                ..getJuzaasList()
                ..getPagesList()
                ..getSurahsList(),
              child: const HomeLayout(),
            );
          },
        );
      case quranScreen:
        return MaterialPageRoute(
          builder: (context) {
            int pageNumber = settings.arguments as int;
            return QuranScreen(
              pageNumber: pageNumber,
            );
          },
        );
    }
  }
}
