import 'package:bloc/bloc.dart';

import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/entities/variant/variant_entity.dart';
import '../../../domain/usecases/cart/add_cart_usecase.dart';
import '../../../domain/usecases/cart/delete_cart_usecase.dart';
import '../../../domain/usecases/cart/get_cart_usecase.dart';
import '../../../domain/usecases/cart/update_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUsecase getCategoryUsecase;
  final AddCartUsecase addCartUsecase;
  final UpdateCartUsecase updateCartUsecase;
  final DeleteCartUsecase deleteCartUsecase;

  CartBloc(this.getCategoryUsecase, this.addCartUsecase, this.updateCartUsecase,
      this.deleteCartUsecase)
      : super(CartState()) {
    on<GetCartEvent>(_getCart);
    on<AddCartEvent>(_addCart);
    on<UpdateCartEvent>(_updateCart);
    on<DeleteCartEvent>(_deleteCart);
  }

  _getCart(GetCartEvent event, Emitter<CartState> emit) async {
    // Show loader only if we have no wishlist yet
    if (state.cart == null || state.cart!.cart.isEmpty) {
      emit(state.copyWith(status: CartStatus.loading));
    } else {
      // Keep loaded state, but we can still update other fields if needed
      emit(state.copyWith(status: CartStatus.loaded));
    }

    final result = await getCategoryUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(status: CartStatus.error, errorMsg: failure.message));
    }, (loadedCart) {
      emit(state.copyWith(status: CartStatus.loaded, cart: loadedCart));
    });
  }

  _addCart(AddCartEvent event, Emitter<CartState> emit) async {
    // Show loader only if we have no wishlist yet
    if (state.cart == null || state.cart!.cart.isEmpty) {
      emit(state.copyWith(addCartStatus: AddCartStatus.loading));
    } else {
      // Keep loaded state, but we can still update other fields if needed
      emit(state.copyWith(addCartStatus: AddCartStatus.loaded));
    }
    final result = await addCartUsecase.call(
        {"productId": event.productId, "variant": event.variant.toJson()});

    result.fold((failure) {
      emit(state.copyWith(
          addCartStatus: AddCartStatus.error, errorMsg: failure.message));
    }, (loadedCart) {
      emit(state.copyWith(
          addCartStatus: AddCartStatus.loaded, successMsg: loadedCart.message));
    });
  }

  _updateCart(UpdateCartEvent event, Emitter<CartState> emit) async {
    // Show loader only if we have no wishlist yet
    if (state.cart == null || state.cart!.cart.isEmpty) {
      emit(state.copyWith(updateCartStatus: UpdateCartStatus.loading));
    } else {
      // Keep loaded state, but we can still update other fields if needed
      emit(state.copyWith(updateCartStatus: UpdateCartStatus.loaded));
    }

    final result = await updateCartUsecase
        .call({"_id": event.id, "variant": event.variant, "qty": event.qty});

    result.fold((failure) {
      emit(state.copyWith(
          updateCartStatus: UpdateCartStatus.error, errorMsg: failure.message));
    }, (loadedCart) {
      emit(state.copyWith(
          updateCartStatus: UpdateCartStatus.loaded,
          successMsg: loadedCart.message));
    });
  }

  _deleteCart(DeleteCartEvent event, Emitter<CartState> emit) async {
    // Show loader only if we have no wishlist yet
    if (state.cart == null || state.cart!.cart.isEmpty) {
      emit(state.copyWith(deleteCartStatus: DeleteCartStatus.loading));
    } else {
      // Keep loaded state, but we can still update other fields if needed
      emit(state.copyWith(deleteCartStatus: DeleteCartStatus.loaded));
    }

    final result = await deleteCartUsecase.call({"_id": event.id});

    result.fold((failure) {
      emit(state.copyWith(
          deleteCartStatus: DeleteCartStatus.error, errorMsg: failure.message));
    }, (loadedCart) {
      emit(state.copyWith(
          deleteCartStatus: DeleteCartStatus.loaded,
          successMsg: loadedCart.message));
    });
  }
}
