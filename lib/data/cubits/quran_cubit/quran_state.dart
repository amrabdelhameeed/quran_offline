part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}

class GetPagesState extends QuranState {
  final List<Page> pages;

  GetPagesState(this.pages);
}

class GetSurahsState extends QuranState {
  final List<Surah> surahs;

  GetSurahsState(this.surahs);
}

class GetJuzaasState extends QuranState {
  final List<Juzaa> juzaas;

  GetJuzaasState(this.juzaas);
}

class OnBookmarkSavedState extends QuranState {}
