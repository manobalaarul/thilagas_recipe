import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'core/theme/bloc/theme_bloc.dart';
import 'di/di_module.dart';
import 'features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'features/presentation/bloc/category_bloc/category_bloc.dart';
import 'features/presentation/bloc/login/login_bloc.dart';
import 'features/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'features/presentation/bloc/product_bloc/product_bloc.dart';

class AppBlocProvider {
  static List<SingleChildWidget> get providers {
    return [
      BlocProvider<OfferBloc>(create: (context) => OfferBloc(sl())),
      BlocProvider<CategoryBloc>(create: (context) => CategoryBloc(sl())),
      BlocProvider<ProductBloc>(create: (context) => ProductBloc(sl())),
      BlocProvider(create: (context) => ThemeBloc()..add(LoadThemeEvent())),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl())),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc(sl())),
      BlocProvider<CartBloc>(create: (context) => CartBloc(sl())),
    ];
  }
}
