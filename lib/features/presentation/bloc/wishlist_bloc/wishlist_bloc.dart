import 'package:bloc/bloc.dart';

import '../../../domain/entities/wishlist/get/wishlist_response_entity.dart';
import '../../../domain/usecases/wishlist/add_wishlist_usecase.dart';
import '../../../domain/usecases/wishlist/get_wishlist_usecase.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlistUsecase getCategoryUsecase;
  final AddWishlistUsecase addWishlistUsecase;

  WishlistBloc(this.getCategoryUsecase, this.addWishlistUsecase)
      : super(WishlistState()) {
    on<GetWishlistEvent>(_getWishlist);
    on<AddToWishlistEvent>(_addToWishlist);
  }

  _getWishlist(GetWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(status: WishlistStatus.loading));

    final result = await getCategoryUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(
          status: WishlistStatus.error, errorMsg: failure.message));
    }, (loadedWishlist) {
      emit(state.copyWith(
          status: WishlistStatus.loaded, wishlist: loadedWishlist));
    });
  }

  _addToWishlist(AddToWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(addStatus: WishlistAddStatus.loading));

    final result = await addWishlistUsecase.call({
      "productId": event.id,
    });

    result.fold((failure) {
      emit(state.copyWith(
        addStatus: WishlistAddStatus.error,
        errorMsg: failure.message,
      ));
    }, (response) {
      // Merge new item into existing wishlist
      // final updatedWishlist = WishlistResponseEntity(
      //   wishlist: [...state.wishlist?.wishlist ?? [], response.addedData],
      // );

      emit(state.copyWith(
        addStatus: WishlistAddStatus.loaded,
        // wishlist: updatedWishlist,
        successMsg: response.message,
      ));
    });
  }
}
