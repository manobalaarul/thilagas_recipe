import 'package:get_it/get_it.dart';
import 'package:thilagas_recipe/features/data/remote/datasource/cart/cart_remote_datasource.dart';
import 'package:thilagas_recipe/features/data/repository/cart/cart_repository_impl.dart';
import 'package:thilagas_recipe/features/domain/repository/cart/cart_repository.dart';
import 'package:thilagas_recipe/features/domain/usecases/cart/get_cart_usecase.dart';
import 'package:thilagas_recipe/features/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/login/login_bloc.dart';

import '../core/network/dio_client.dart';
import '../features/data/remote/datasource/auth/auth_remote_datasource.dart';
import '../features/data/remote/datasource/category/category_remote_datasource.dart';
import '../features/data/remote/datasource/offers/offers_remote_datasource.dart';
import '../features/data/remote/datasource/product/product_remote_datasource.dart';
import '../features/data/repository/auth/auth_repository_impl.dart';
import '../features/data/repository/category/category_repository_impl.dart';
import '../features/data/repository/offers/offer_repository_impl.dart';
import '../features/data/repository/product/product_repository_impl.dart';
import '../features/domain/repository/auth/auth_repository.dart';
import '../features/domain/repository/category/category_repository.dart';
import '../features/domain/repository/offers/offer_repository.dart';
import '../features/domain/repository/product/product_repository.dart';
import '../features/domain/usecases/auth/login_usecase.dart';
import '../features/domain/usecases/auth/register_usecase.dart';
import '../features/domain/usecases/category/get_category_usecase.dart';
import '../features/domain/usecases/offers/get_offer_usecase.dart';
import '../features/domain/usecases/product/get_product_usecase.dart';
import '../features/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../features/presentation/bloc/category_bloc/category_bloc.dart';
import '../features/presentation/bloc/offer_bloc/offer_bloc.dart';
import '../features/presentation/bloc/product_bloc/product_bloc.dart';

final sl = GetIt.instance;

class DiModule {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => OfferBloc(sl()));
    sl.registerFactory(() => CategoryBloc(sl()));
    sl.registerFactory(() => ProductBloc(sl()));
    sl.registerFactory(() => AuthBloc(sl<RegisterUsecase>()));
    sl.registerFactory(() => LoginBloc(sl<LoginUsecase>()));
    sl.registerFactory(() => CartBloc(sl<GetCartUsecase>()));

    //Usecase
    sl.registerLazySingleton(() => GetOfferUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoryUsecase(sl()));
    sl.registerLazySingleton(() => GetProductUsecase(sl()));
    sl.registerLazySingleton(() => RegisterUsecase(sl()));
    sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => GetCartUsecase(sl()));

    //Repository
    sl.registerLazySingleton<OfferRepository>(
        () => OfferRepositoryImpl(offersRemoteDatasource: sl()));
    sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(categoryRemoteDatasource: sl()));
    sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(productRemoteDatasource: sl()));
    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDatasource: sl()));
    sl.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(cartRemoteDatasource: sl()));

    //Datasource
    sl.registerLazySingleton<OffersRemoteDatasource>(
        () => OffersRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<CategoryRemoteDatasource>(
        () => CategoryRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<CartRemoteDatasourceImpl>(
        () => CartRemoteDatasourceImpl(dioClient: sl()));

    //Core
    sl.registerLazySingleton(() => DioClient());
  }
}
