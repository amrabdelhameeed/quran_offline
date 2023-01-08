import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/cashe_helper.dart';
import '../../models/juzaa.dart';
import '../../models/page.dart';
import '../../models/surah.dart';
import '../../repository/json_repository.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.jsonRepository) : super(QuranInitial());
  final JsonRepository jsonRepository;
  static QuranCubit get(context) => BlocProvider.of(context);
  List<Juzaa> juzaas = [];
  List<Page> pages = [];
  List<Surah> surahs = [];

  List<Juzaa> getJuzaasList() {
    if (juzaas.isEmpty) {
      jsonRepository.getJuzaasList().then((list) {
        juzaas.addAll(list);
        emit(GetJuzaasState(juzaas));
      });
    }
    return juzaas;
  }

  List<Page> getPagesList() {
    if (pages.isEmpty) {
      jsonRepository.getPagesList().then((list) {
        pages.addAll(list);
        emit(GetPagesState(pages));
      });
    }
    return pages;
  }

  List<Surah> getSurahsList() {
    if (surahs.isEmpty) {
      jsonRepository.getSurahsList().then((list) {
        surahs.addAll(list);
        emit(GetSurahsState(surahs));
      });
    }
    return surahs;
  }

  int getPageOfJuzaa(Juzaa juzaa) {
    return int.parse(pages
            .firstWhere((page) => ((page.start.verse == juzaa.start.verse &&
                    page.start.index == juzaa.start.index) ||
                (page.end.verse == juzaa.start.verse &&
                    page.end.index == juzaa.start.index)))
            .index) -
        1;
  }

  String? pageNumberNames;
  void setPageNumber(int index) {
    pageNumberCashed = index + 1;
    getSurahsNameOfBookmark(index);
    CasheHelper.setNumber(key: cahseKey, number: pageNumberCashed!);
    emit(OnBookmarkSavedState());
  }

  void getSurahsNameOfBookmark(int indexOfThePage) {
    // print(indexOfThePage);
    pageNumberNames = {
      pages[indexOfThePage].start.nameAr,
      pages[indexOfThePage].end.nameAr
    }.toList().join(',');
    emit(OnBookmarkSavedState());
  }
}
