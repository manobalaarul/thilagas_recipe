import 'package:bloc/bloc.dart';

import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/usecases/cart/get_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUsecase getCategoryUsecase;

  CartBloc(this.getCategoryUsecase) : super(CartState()) {
    on<GetCartEvent>(_getCart);
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
}
