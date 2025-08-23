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

  CartBloc(
    this.getCategoryUsecase,
    this.addCartUsecase,
    this.updateCartUsecase,
    this.deleteCartUsecase,
  ) : super(CartState()) {
    on<GetCartEvent>(_getCart);
    on<AddCartEvent>(_addCart);
    on<UpdateCartEvent>(_updateCart);
    on<DeleteCartEvent>(_deleteCart);
    on<RecalculateCartEvent>(_onRecalculateCart);
    on<ToggleGstEvent>(_onToggleGst);
  }

  Future<void> _getCart(GetCartEvent event, Emitter<CartState> emit) async {
    if (state.cart == null || state.cart!.cart.isEmpty) {
      emit(state.copyWith(status: CartStatus.loading));
    } else {
      emit(state.copyWith(status: CartStatus.loaded));
    }

    final result = await getCategoryUsecase.call({});
    result.fold(
      (failure) {
        emit(state.copyWith(
            status: CartStatus.error, errorMsg: failure.message));
      },
      (loadedCart) {
        emit(state.copyWith(status: CartStatus.loaded, cart: loadedCart));
        add(RecalculateCartEvent(cart: loadedCart, gstPer: 5, isAddGst: false));
      },
    );
  }

  Future<void> _addCart(AddCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(addCartStatus: AddCartStatus.loading));

    final result = await addCartUsecase.call({
      "productId": event.productId,
      "variant": event.variant.toJson(),
    });

    result.fold(
      (failure) {
        emit(state.copyWith(
          addCartStatus: AddCartStatus.error,
          errorMsg: failure.message,
        ));
      },
      (success) {
        emit(state.copyWith(
          addCartStatus: AddCartStatus.loaded,
          successMsg: success.message,
        ));
        // 🔑 Fetch latest cart after add
        add(GetCartEvent());
      },
    );
  }

  Future<void> _updateCart(
      UpdateCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(updateCartStatus: UpdateCartStatus.loading));

    final result = await updateCartUsecase.call({
      "_id": event.id,
      "variant": event.variant.toJson(),
      "qty": event.qty,
    });

    result.fold(
      (failure) {
        emit(state.copyWith(
          updateCartStatus: UpdateCartStatus.error,
          errorMsg: failure.message,
        ));
      },
      (success) {
        emit(state.copyWith(
          updateCartStatus: UpdateCartStatus.loaded,
          successMsg: success.message,
        ));
        // 🔑 Fetch latest cart after update
        add(GetCartEvent());
      },
    );
  }

  Future<void> _deleteCart(
      DeleteCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(deleteCartStatus: DeleteCartStatus.loading));

    final result = await deleteCartUsecase.call({"_id": event.id});

    result.fold(
      (failure) {
        emit(state.copyWith(
          deleteCartStatus: DeleteCartStatus.error,
          errorMsg: failure.message,
        ));
      },
      (success) {
        emit(state.copyWith(
          deleteCartStatus: DeleteCartStatus.loaded,
          successMsg: success.message,
        ));
        // 🔑 Fetch latest cart after delete
        add(GetCartEvent());
      },
    );
  }

  void _onRecalculateCart(
    RecalculateCartEvent event,
    Emitter<CartState> emit,
  ) {
    double total = 0.0;
    double originalTotal = 0.0;
    int qty = 0;

    for (var item in event.cart.cart) {
      int originalPrice = item.variant.price;
      int discountPercent = item.variant.discount;

      // calculate discount amount
      int discountAmount = ((originalPrice * discountPercent) / 100).ceil();

      // price after discount
      int discountedPrice = originalPrice - discountAmount;

      int quantity = item.quantity;

      total += discountedPrice * quantity;
      originalTotal += originalPrice * quantity;
      qty += quantity;
    }

    double gstPer = event.gstPer / 100.0;
    double gst = event.isAddGst ? total * gstPer : 0.0;

    emit(state.copyWith(
      subTotal: total,
      total: total + gst,
      noDiscountTotal: originalTotal,
      gst: gst,
      totalQty: qty,
      isAddGst: event.isAddGst,
    ));
  }

  void _onToggleGst(
    ToggleGstEvent event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(isAddGst: !state.isAddGst));
  }
}
