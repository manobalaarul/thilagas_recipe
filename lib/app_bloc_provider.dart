import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:thilagas_recipe/core/theme/bloc/theme_bloc.dart';
import 'features/presentation/screens/home/bloc/offer_bloc/offer_bloc.dart';
import 'di/di_module.dart';

class AppBlocProvider {
  static List<SingleChildWidget> get providers {
    return [
      BlocProvider<OfferBloc>(create: (context) => OfferBloc(sl())),
      BlocProvider(create: (context) => ThemeBloc()..add(LoadThemeEvent()))
    ];
  }
}
