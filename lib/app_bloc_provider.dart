import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:thilagas_recipe/features/presentation/bloc/razorpay_bloc/razorpay_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/select_address_bloc/select_address_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/user_bloc/user_bloc.dart';

import 'core/theme/bloc/theme_bloc.dart';
import 'di/di_module.dart';
import 'features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'features/presentation/bloc/category_bloc/category_bloc.dart';
import 'features/presentation/bloc/login/login_bloc.dart';
import 'features/presentation/bloc/login_check_bloc/logincheck_bloc.dart';
import 'features/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'features/presentation/bloc/product_bloc/product_bloc.dart';
import 'features/presentation/bloc/wishlist_bloc/wishlist_bloc.dart';

class AppBlocProvider {
  static List<SingleChildWidget> get providers {
    return [
      BlocProvider<OfferBloc>(
          create: (context) => OfferBloc(sl())..add(GetOfferEvent())),
      BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(sl(), sl())
            ..add(GetCategoryEvent())
            ..add(GetSubCategoryEvent())),
      BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(sl(), sl(), sl())..add(GetProductEvent())),
      BlocProvider(create: (context) => ThemeBloc()..add(LoadThemeEvent())),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl())),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc(sl())),
      BlocProvider<CartBloc>(
          create: (context) =>
              CartBloc(sl(), sl(), sl(), sl())..add(GetCartEvent())),
      BlocProvider<WishlistBloc>(
          create: (context) =>
              WishlistBloc(sl(), sl(), sl())..add(GetWishlistEvent())),
      BlocProvider<LogincheckBloc>(create: (context) => LogincheckBloc()),
      BlocProvider<UserBloc>(
          create: (context) => UserBloc(sl(), sl(), sl(), sl())
            ..add(FetchUserEvent())
            ..add(GetAddressEvent())
            ..add(GetOrderEvent())),
      BlocProvider<RazorpayBloc>(create: (context) => RazorpayBloc(sl(), sl())),
      BlocProvider<SelectAddressBloc>(create: (context) => SelectAddressBloc()),
    ];
  }
}
