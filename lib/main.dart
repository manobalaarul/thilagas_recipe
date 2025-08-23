import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thilagas_recipe/core/constants/app_constants.dart';
import 'package:thilagas_recipe/features/presentation/screens/auth/onboarding_page.dart';

import 'app_bloc_provider.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'di/di_module.dart';
import 'features/presentation/screens/maintab/maintab.dart';
import 'features/utils/helper/app_observer.dart';
import 'features/utils/helper/value_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiModule().init();
  await Prefs.init();
// Check if key exists
  bool? savedStatus = Prefs.getBool(AppConstants.onBoardStatus);

  if (savedStatus == null) {
    // First time app open → set true
    await Prefs.setBool(AppConstants.onBoardStatus, true);
    savedStatus = true;
  }

  Bloc.observer = AppObserver();
  runApp(MyApp(onBoardStatus: savedStatus));
}

class MyApp extends StatelessWidget {
  final bool onBoardStatus;
  const MyApp({super.key, required this.onBoardStatus});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProvider.providers,
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return GetMaterialApp(
            title: 'Thilagas Recipe',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
            home: onBoardStatus ? const OnBoardingPage() : const MainTab(),
          );
        }));
  }
}
