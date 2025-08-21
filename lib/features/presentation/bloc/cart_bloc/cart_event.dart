part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class GetCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  final Variant variant;
  final String productId;

  AddCartEvent({required this.variant, required this.productId});
}

class UpdateCartEvent extends CartEvent {
  final Variant variant;
  final int qty;
  final String id;

  UpdateCartEvent({required this.variant, required this.qty, required this.id});
}

class DeleteCartEvent extends CartEvent {
  final String id;

  DeleteCartEvent({required this.id});
}
