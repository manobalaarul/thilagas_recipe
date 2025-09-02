import 'package:get_it/get_it.dart';

import '../core/network/dio_client.dart';
import '../features/data/remote/datasource/auth/auth_remote_datasource.dart';
import '../features/data/remote/datasource/cart/cart_remote_datasource.dart';
import '../features/data/remote/datasource/category/category_remote_datasource.dart';
import '../features/data/remote/datasource/offers/offers_remote_datasource.dart';
import '../features/data/remote/datasource/product/product_remote_datasource.dart';
import '../features/data/remote/datasource/razorpay/razorpay_remote_datasource.dart';
import '../features/data/remote/datasource/user/user_remote_datasource.dart';
import '../features/data/remote/datasource/wishlist/wishlist_remote_datasource.dart';
import '../features/data/repository/auth/auth_repository_impl.dart';
import '../features/data/repository/cart/cart_repository_impl.dart';
import '../features/data/repository/category/category_repository_impl.dart';
import '../features/data/repository/offers/offer_repository_impl.dart';
import '../features/data/repository/product/product_repository_impl.dart';
import '../features/data/repository/razorpay/razorpay_repository_impl.dart';
import '../features/data/repository/user/user_repository_impl.dart';
import '../features/data/repository/wishlist/wishlist_repository_impl.dart';
import '../features/domain/repository/auth/auth_repository.dart';
import '../features/domain/repository/cart/cart_repository.dart';
import '../features/domain/repository/category/category_repository.dart';
import '../features/domain/repository/offers/offer_repository.dart';
import '../features/domain/repository/product/product_repository.dart';
import '../features/domain/repository/razorpay/payment_repository.dart';
import '../features/domain/repository/user/user_repository.dart';
import '../features/domain/repository/wishlist/wishlist_repository.dart';
import '../features/domain/usecases/auth/login_usecase.dart';
import '../features/domain/usecases/auth/register_usecase.dart';
import '../features/domain/usecases/cart/add_cart_usecase.dart';
import '../features/domain/usecases/cart/delete_cart_usecase.dart';
import '../features/domain/usecases/cart/get_cart_usecase.dart';
import '../features/domain/usecases/cart/update_cart_usecase.dart';
import '../features/domain/usecases/category/get_category_usecase.dart';
import '../features/domain/usecases/category/get_sub_category_usecase.dart';
import '../features/domain/usecases/offers/get_offer_usecase.dart';
import '../features/domain/usecases/product/get_category_product_usecase.dart';
import '../features/domain/usecases/product/get_product_usecase.dart';
import '../features/domain/usecases/product/get_search_product_usecase.dart';
import '../features/domain/usecases/razorpay/create_order_usecase.dart';
import '../features/domain/usecases/razorpay/get_delivery_charge_usecase.dart';
import '../features/domain/usecases/razorpay/verify_order_usecase.dart';
import '../features/domain/usecases/user/add_address_usecase.dart';
import '../features/domain/usecases/user/delete_address_usecase.dart';
import '../features/domain/usecases/user/fetch_user_usecase.dart';
import '../features/domain/usecases/user/get_address_usecase.dart';
import '../features/domain/usecases/user/get_orders_usecase.dart';
import '../features/domain/usecases/user/update_user_usecase.dart';
import '../features/domain/usecases/wishlist/add_wishlist_usecase.dart';
import '../features/domain/usecases/wishlist/get_wishlist_usecase.dart';
import '../features/domain/usecases/wishlist/remove_wishlist_usecase.dart';
import '../features/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../features/presentation/bloc/cart_bloc/cart_bloc.dart';
import '../features/presentation/bloc/category_bloc/category_bloc.dart';
import '../features/presentation/bloc/login/login_bloc.dart';
import '../features/presentation/bloc/login_check_bloc/logincheck_bloc.dart';
import '../features/presentation/bloc/offer_bloc/offer_bloc.dart';
import '../features/presentation/bloc/product_bloc/product_bloc.dart';
import '../features/presentation/bloc/razorpay_bloc/razorpay_bloc.dart';
import '../features/presentation/bloc/select_address_bloc/select_address_bloc.dart';
import '../features/presentation/bloc/user_bloc/user_bloc.dart';
import '../features/presentation/bloc/wishlist_bloc/wishlist_bloc.dart';

final sl = GetIt.instance;

class DiModule {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => OfferBloc(sl()));
    sl.registerFactory(() => CategoryBloc(sl(), sl()));
    sl.registerFactory(() => ProductBloc(sl(), sl(), sl()));
    sl.registerFactory(() => AuthBloc(sl<RegisterUsecase>()));
    sl.registerFactory(() => LoginBloc(sl<LoginUsecase>()));
    sl.registerFactory(() => LogincheckBloc());
    sl.registerFactory(() => UserBloc(sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => CartBloc(
        sl<GetCartUsecase>(),
        sl<AddCartUsecase>(),
        sl<UpdateCartUsecase>(),
        sl<DeleteCartUsecase>()));
    sl.registerFactory(() => WishlistBloc(sl<GetWishlistUsecase>(),
        sl<AddWishlistUsecase>(), sl<RemoveWishlistUsecase>()));
    sl.registerFactory(() => RazorpayBloc(sl(), sl()));
    sl.registerFactory(() => SelectAddressBloc(sl()));

    //Usecase
    sl.registerLazySingleton(() => GetOfferUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoryUsecase(sl()));
    sl.registerLazySingleton(() => GetSubCategoryUsecase(sl()));
    sl.registerLazySingleton(() => GetProductUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoryProductUsecase(sl()));
    sl.registerLazySingleton(() => GetSearchProductUsecase(sl()));
    sl.registerLazySingleton(() => RegisterUsecase(sl()));
    sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => GetCartUsecase(sl()));
    sl.registerLazySingleton(() => AddCartUsecase(sl()));
    sl.registerLazySingleton(() => UpdateCartUsecase(sl()));
    sl.registerLazySingleton(() => DeleteCartUsecase(sl()));
    sl.registerLazySingleton(() => GetWishlistUsecase(sl()));
    sl.registerLazySingleton(() => AddWishlistUsecase(sl()));
    sl.registerLazySingleton(() => RemoveWishlistUsecase(sl()));
    sl.registerLazySingleton(() => FetchUserUsecase(sl()));
    sl.registerLazySingleton(() => UpdateUserUsecase(sl()));
    sl.registerLazySingleton(() => GetAddressUsecase(sl()));
    sl.registerLazySingleton(() => AddAddressUsecase(sl()));
    sl.registerLazySingleton(() => DeleteAddressUsecase(sl()));
    sl.registerLazySingleton(() => GetOrderUsecase(sl()));
    sl.registerLazySingleton(() => CreateOrderUsecase(sl()));
    sl.registerLazySingleton(() => VerifyPaymentUsecase(sl()));
    sl.registerLazySingleton(() => GetDeliveryChargeUsecase(sl()));

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
    sl.registerLazySingleton<WishlistRepository>(
        () => WishlistRepositoryImpl(wishlistRemoteDatasource: sl()));
    sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(userRemoteDatasource: sl()));
    sl.registerLazySingleton<RazorpayRepository>(
        () => RazorpayRepositoryImpl(razorpayRemoteDatasource: sl()));

    //Datasource
    sl.registerLazySingleton<OffersRemoteDatasource>(
        () => OffersRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<CategoryRemoteDatasource>(
        () => CategoryRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<CartRemoteDatasource>(
        () => CartRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<WishlistRemoteDatasource>(
        () => WishlistRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<UserRemoteDatasource>(
        () => UserRemoteDatasourceImpl(dioClient: sl()));
    sl.registerLazySingleton<RazorpayRemoteDatasource>(
        () => RazorpayRemoteDatasourceImpl(dioClient: sl()));

    //Core
    sl.registerLazySingleton(() => DioClient());
  }
}
