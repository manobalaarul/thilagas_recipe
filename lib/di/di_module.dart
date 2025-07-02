import 'package:get_it/get_it.dart';
import 'package:thilagas_recipe/features/data/remote/datasource/product/product_remote_datasource.dart';
import '../features/data/remote/datasource/category/category_remote_datasource.dart';
import '../features/data/repository/category/category_repository_impl.dart';
import '../features/data/repository/product/product_repository_impl.dart';
import '../features/domain/repository/category/category_repository.dart';
import '../features/domain/repository/product/product_repository.dart';
import '../features/domain/usecases/product/get_product_usecase.dart';
import '../features/presentation/bloc/category_bloc/category_bloc.dart';
import '../features/presentation/bloc/product_bloc/product_bloc.dart';
import '../core/network/dio_client.dart';
import '../features/data/remote/datasource/offers/offers_remote_datasource.dart';
import '../features/data/repository/offers/offer_repository_impl.dart';
import '../features/domain/repository/offers/offer_repository.dart';
import '../features/domain/usecases/category/get_category_usecase.dart';
import '../features/domain/usecases/offers/get_offer_usecase.dart';
import '../features/presentation/bloc/offer_bloc/offer_bloc.dart';

final sl = GetIt.instance;

class DiModule {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => OfferBloc(sl()));
    sl.registerFactory(() => CategoryBloc(sl()));
    sl.registerFactory(() => ProductBloc(sl()));

    //Usecase
    sl.registerLazySingleton(() => GetOfferUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoryUsecase(sl()));
    sl.registerLazySingleton(() => GetProductUsecase(sl()));

    //Repository
    sl.registerLazySingleton<OfferRepository>(
        () => OfferRepositoryImpl(offersRemoteDatasource: sl()));
    sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(categoryRemoteDatasource: sl()));
    sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(productRemoteDatasource: sl()));

    //Datasource
    sl.registerLazySingleton<OffersRemoteDatasource>(
        () => OffersRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<CategoryRemoteDatasource>(
        () => CategoryRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDatasourceImpl(dioClient: sl()));

    //Core
    sl.registerLazySingleton(() => DioClient());
  }
}
