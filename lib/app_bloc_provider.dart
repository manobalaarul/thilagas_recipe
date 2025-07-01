import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'features/presentation/screens/home/bloc/offer_bloc/offer_bloc.dart';
import 'di/di_module.dart';

class AppBlocProvider {
  static List<SingleChildWidget> get providers {
    return [BlocProvider<OfferBloc>(create: (context) => OfferBloc(sl()))];
  }
}
