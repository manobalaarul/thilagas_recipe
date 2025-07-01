import 'package:get_it/get_it.dart';
import '../core/network/dio_client.dart';
import '../features/data/remote/datasource/offers/offers_remote_datasource.dart';
import '../features/data/repository/offers/offer_repository_impl.dart';
import '../features/domain/repository/offers/offer_repository.dart';
import '../features/domain/usecases/offers/get_offer_usecase.dart';
import '../features/presentation/screens/home/bloc/offer_bloc/offer_bloc.dart';

final sl = GetIt.instance;

class DiModule {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => OfferBloc(sl()));

    //Usecase
    sl.registerLazySingleton(() => GetOfferUsecase(sl()));

    //Repository
    sl.registerLazySingleton<OfferRepository>(
        () => OfferRepositoryImpl(offersRemoteDatasource: sl()));

    //Datasource
    sl.registerLazySingleton<OffersRemoteDatasource>(
        () => OffersRemoteDatasourceImpl(dioClient: sl()));

    //Core
    sl.registerLazySingleton(() => DioClient());
  }
}
