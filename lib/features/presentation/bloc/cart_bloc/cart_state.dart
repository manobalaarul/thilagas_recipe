part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }

enum AddCartStatus { initial, loading, loaded, error }

enum UpdateCartStatus { initial, loading, loaded, error }

class CartState {
  final CartStatus status;
  final AddCartStatus addCartStatus;
  final UpdateCartStatus updateCartStatus;
  final CartResponseEntity? cart;
  final String? errorMsg;
  final String? successMsg;

  CartState(
      {this.status = CartStatus.initial,
      this.addCartStatus = AddCartStatus.initial,
      this.updateCartStatus = UpdateCartStatus.initial,
      this.cart,
      this.errorMsg,
      this.successMsg});

  CartState copyWith(
      {CartStatus? status,
      AddCartStatus? addCartStatus,
      UpdateCartStatus? updateCartStatus,
      final CartResponseEntity? cart,
      String? errorMsg,
      String? successMsg}) {
    return CartState(
        status: status ?? this.status,
        addCartStatus: addCartStatus ?? this.addCartStatus,
        updateCartStatus: updateCartStatus ?? this.updateCartStatus,
        cart: cart ?? this.cart,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
