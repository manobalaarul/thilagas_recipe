import 'package:bloc/bloc.dart';

import '../../../domain/entities/cart/cart_response_entity.dart';
import '../../../domain/usecases/cart/get_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUsecase getCategoryUsecase;

  CartBloc(this.getCategoryUsecase) : super(CartState()) {
    on<GetCartEvent>(_getCategory);
  }

  _getCategory(GetCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));

    final result = await getCategoryUsecase.call({});

    result.fold((failure) {
      emit(state.copyWith(status: CartStatus.error, errorMsg: failure.message));
    }, (loadedCart) {
      emit(state.copyWith(status: CartStatus.loaded, cart: loadedCart));
    });
  }
}
