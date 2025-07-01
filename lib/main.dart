import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'di/di_module.dart';
import 'app_bloc_provider.dart';
import 'features/presentation/screens/home/home_page.dart';
import 'features/utils/helper/app_observer.dart';
import 'features/utils/helper/value_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiModule().init();
  await Prefs.init();
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.providers,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Thilagas Recipe',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeMode,
              home: const HomePage());
        },
      ),
    );
  }
}
