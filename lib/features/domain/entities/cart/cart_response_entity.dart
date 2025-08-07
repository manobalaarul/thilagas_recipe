// To parse this JSON data, do
//
//     final cartResponseEntity = cartResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cart_response_entity.g.dart';

CartResponseEntity cartResponseEntityFromJson(String str) => CartResponseEntity.fromJson(json.decode(str));

String cartResponseEntityToJson(CartResponseEntity data) => json.encode(data.toJson());

@JsonSerializable()
class CartResponseEntity {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "cart")
    List<Cart> cart;
    @JsonKey(name: "error")
    bool error;
    @JsonKey(name: "success")
    bool success;

    CartResponseEntity({
        required this.message,
        required this.cart,
        required this.error,
        required this.success,
    });

    factory CartResponseEntity.fromJson(Map<String, dynamic> json) => _$CartResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$CartResponseEntityToJson(this);
}

@JsonSerializable()
class Cart {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "productId")
    ProductId productId;
    @JsonKey(name: "userId")
    String userId;
    @JsonKey(name: "createdAt")
    DateTime createdAt;
    @JsonKey(name: "updatedAt")
    DateTime updatedAt;
    @JsonKey(name: "__v")
    int v;

    Cart({
        required this.id,
        required this.productId,
        required this.userId,
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
    @JsonKey(name: "more_details")
    MoreDetails? moreDetails;

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
        this.moreDetails,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => _$ProductIdFromJson(json);

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

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class MoreDetails {
    @JsonKey(name: "Product Name")
    String productName;
    @JsonKey(name: "Brand")
    String brand;
    @JsonKey(name: "Shelf Life")
    String shelfLife;
    @JsonKey(name: "Storage Instructions")
    String storageInstructions;
    @JsonKey(name: "Usage")
    String usage;
    @JsonKey(name: "Flavor Profile")
    String flavorProfile;
    @JsonKey(name: "Country of Origin")
    String countryOfOrigin;
    @JsonKey(name: "Certification")
    String certification;
    @JsonKey(name: "Net Weights")
    String netWeights;

    MoreDetails({
        required this.productName,
        required this.brand,
        required this.shelfLife,
        required this.storageInstructions,
        required this.usage,
        required this.flavorProfile,
        required this.countryOfOrigin,
        required this.certification,
        required this.netWeights,
    });

    factory MoreDetails.fromJson(Map<String, dynamic> json) => _$MoreDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$MoreDetailsToJson(this);
}

@JsonSerializable()
class Variant {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "price")
    int price;
    @JsonKey(name: "discount")
    int discount;
    @JsonKey(name: "stock")
    int stock;
    @JsonKey(name: "_id")
    String id;

    Variant({
        required this.name,
        required this.price,
        required this.discount,
        required this.stock,
        required this.id,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

    Map<String, dynamic> toJson() => _$VariantToJson(this);
}
