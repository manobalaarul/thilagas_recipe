// To parse this JSON data, do
//
//     final cartResponseEntity = cartResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../variant/variant_entity.dart';

part 'cart_response_entity.g.dart';

CartResponseEntity cartResponseEntityFromJson(String str) =>
    CartResponseEntity.fromJson(json.decode(str));

String cartResponseEntityToJson(CartResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CartResponseEntity {
  @JsonKey(name: "data")
  List<Cart> cart;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  CartResponseEntity({
    required this.cart,
    required this.message,
    required this.error,
    required this.success,
  });

  factory CartResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CartResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseEntityToJson(this);
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "variant")
  Variant variant;
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "productId")
  ProductId productId;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  Cart({
    required this.variant,
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class ProductId {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  List<String> image;
  @JsonKey(name: "category")
  List<Category> category;
  @JsonKey(name: "sub_category")
  List<Category> subCategory;
  @JsonKey(name: "publish")
  bool publish;
  @JsonKey(name: "variants")
  List<Variant> variants;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  ProductId({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.subCategory,
    required this.publish,
    required this.variants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) =>
      _$ProductIdFromJson(json);

  Map<String, dynamic> toJson() => _$ProductIdToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;
  @JsonKey(name: "category")
  List<dynamic>? category;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.category,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
