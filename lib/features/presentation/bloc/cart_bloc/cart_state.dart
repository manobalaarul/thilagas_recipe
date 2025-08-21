part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }

enum AddCartStatus { initial, loading, loaded, error }

enum UpdateCartStatus { initial, loading, loaded, error }

enum DeleteCartStatus { initial, loading, loaded, error }

class CartState {
  final CartStatus status;
  final AddCartStatus addCartStatus;
  final UpdateCartStatus updateCartStatus;
  final DeleteCartStatus deleteCartStatus;
  final CartResponseEntity? cart;
  final String? errorMsg;
  final String? successMsg;

  CartState(
      {this.status = CartStatus.initial,
      this.addCartStatus = AddCartStatus.initial,
      this.updateCartStatus = UpdateCartStatus.initial,
      this.deleteCartStatus = DeleteCartStatus.initial,
      this.cart,
      this.errorMsg,
      this.successMsg});

  CartState copyWith(
      {CartStatus? status,
      AddCartStatus? addCartStatus,
      UpdateCartStatus? updateCartStatus,
      DeleteCartStatus? deleteCartStatus,
      final CartResponseEntity? cart,
      String? errorMsg,
      String? successMsg}) {
    return CartState(
        status: status ?? this.status,
        addCartStatus: addCartStatus ?? this.addCartStatus,
        updateCartStatus: updateCartStatus ?? this.updateCartStatus,
        deleteCartStatus: deleteCartStatus ?? this.deleteCartStatus,
        cart: cart ?? this.cart,
        errorMsg: errorMsg ?? this.errorMsg,
        successMsg: successMsg ?? this.successMsg);
  }
}
