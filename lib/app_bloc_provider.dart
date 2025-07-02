import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'features/presentation/bloc/category_bloc/category_bloc.dart';
import 'features/presentation/bloc/product_bloc/product_bloc.dart';
import 'features/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'di/di_module.dart';

class AppBlocProvider {
  static List<SingleChildWidget> get providers {
    return [
      BlocProvider<OfferBloc>(create: (context) => OfferBloc(sl())),
      BlocProvider<CategoryBloc>(create: (context) => CategoryBloc(sl())),
      BlocProvider<ProductBloc>(create: (context) => ProductBloc(sl())),
      BlocProvider(create: (context) => ThemeBloc()..add(LoadThemeEvent()))
    ];
  }
}
