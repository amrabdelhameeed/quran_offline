import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/constants/strings.dart';
import '../../../core/utils/cashe_helper.dart';
part 'theme_state.dart';
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool? isD;
  void changeIsDark() {
    isD = !isD!;
    CasheHelper.setBoolean(key: cahseKeyForDarkMode, boolean: isD!);
    emit(OnThemeChangedState());
  }
  void getThemeModeinit() {
    isD = isDarkCashed;
    emit(OnThemeChangedState());
  }
}
