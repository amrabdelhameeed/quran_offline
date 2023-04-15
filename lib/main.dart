// ignore_for_file: deprecated_member_use

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/strings.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/cashe_helper.dart';
import 'core/utils/observer.dart';
import 'data/cubits/theme_cubit/theme_cubit.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.initCasheHelper();
  pageNumberCashed = CasheHelper.getNumber(key: cahseKey);
  isDarkCashed = CasheHelper.getBoolean(key: cahseKeyForDarkMode);
  isOnDoubleTapInfoDismmised =
      CasheHelper.getBoolean(key: cahseKeyForisOnDoubleTapInfoDismmised);
  BlocOverrides.runZoned(
    () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((value) {
        runApp(DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) {
            return MyApp(
              appRouter: AppRouter(),
            );
          },
        ));
      });
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit()..getThemeModeinit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var cubit = ThemeCubit.get(context);
          return MaterialApp(
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            title: "Quran Offline",
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: cubit.isD! ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: homeLayout,
          );
        },
      ),
    );
  }
}
