import 'dart:convert';

import '../../../../domain/entities/cart/cart_response_entity.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel extends CartResponseEntity {
  CartModel({
    required super.message,
    required super.cart,
    required super.error,
    required super.success,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        message: json["message"],
        cart: List<Cart>.from(json["data"].map((x) => Cart.fromJson(x))),
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(cart.map((x) => x.toJson())),
        "error": error,
        "success": success,
      };
}
