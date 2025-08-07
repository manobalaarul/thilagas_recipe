part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }

class CartState {
  final CartStatus status;
  final CartResponseEntity? cart;
  final String? errorMsg;
  final String? successMsg;

  CartState(
      {this.status = CartStatus.initial,
      this.cart,
      this.errorMsg,
      this.successMsg});

  CartState copyWith(
      {CartStatus? status,
      final CartResponseEntity? cart,
      String? errorMsg,
      String? successMsg}) {
    return CartState(
        status: status ?? this.status,
        cart: cart ?? this.cart,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
