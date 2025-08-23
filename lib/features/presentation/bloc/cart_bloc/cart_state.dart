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
  final String? processingProductId; // 👈 track the one being updated
  final double subTotal;
  final double total;
  final double noDiscountTotal;
  final double gst;
  final int totalQty;
  final bool isAddGst;

  CartState({
    this.status = CartStatus.initial,
    this.addCartStatus = AddCartStatus.initial,
    this.updateCartStatus = UpdateCartStatus.initial,
    this.deleteCartStatus = DeleteCartStatus.initial,
    this.cart,
    this.errorMsg,
    this.successMsg,
    this.processingProductId,
    this.subTotal = 0.0,
    this.total = 0.0,
    this.noDiscountTotal = 0.0,
    this.gst = 0.0,
    this.totalQty = 0,
    this.isAddGst = false,
  });

  CartState copyWith({
    CartStatus? status,
    AddCartStatus? addCartStatus,
    UpdateCartStatus? updateCartStatus,
    DeleteCartStatus? deleteCartStatus,
    final CartResponseEntity? cart,
    String? errorMsg,
    String? successMsg,
    String? processingProductId,
    double? subTotal,
    double? total,
    double? noDiscountTotal,
    double? gst,
    int? totalQty,
    bool? isAddGst,
  }) {
    return CartState(
      status: status ?? this.status,
      addCartStatus: addCartStatus ?? this.addCartStatus,
      updateCartStatus: updateCartStatus ?? this.updateCartStatus,
      deleteCartStatus: deleteCartStatus ?? this.deleteCartStatus,
      cart: cart ?? this.cart,
      errorMsg: errorMsg ?? this.errorMsg,
      successMsg: successMsg ?? this.successMsg,
      processingProductId: processingProductId,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      noDiscountTotal: noDiscountTotal ?? this.noDiscountTotal,
      gst: gst ?? this.gst,
      totalQty: totalQty ?? this.totalQty,
      isAddGst: isAddGst ?? this.isAddGst,
    );
  }
}
