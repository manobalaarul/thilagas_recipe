// To parse this JSON data, do
//
//     final wishlistAddResponseEntity = wishlistAddResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'wishlist_add_response_entity.g.dart';

WishlistAddResponseEntity wishlistAddResponseEntityFromJson(String str) => WishlistAddResponseEntity.fromJson(json.decode(str));

String wishlistAddResponseEntityToJson(WishlistAddResponseEntity data) => json.encode(data.toJson());

@JsonSerializable()
class WishlistAddResponseEntity {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "added_data")
    AddedData addedData;
    @JsonKey(name: "error")
    bool error;
    @JsonKey(name: "success")
    bool success;

    WishlistAddResponseEntity({
        required this.message,
        required this.addedData,
        required this.error,
        required this.success,
    });

    factory WishlistAddResponseEntity.fromJson(Map<String, dynamic> json) => _$WishlistAddResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$WishlistAddResponseEntityToJson(this);
}

@JsonSerializable()
class AddedData {
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

    AddedData({
        required this.id,
        required this.productId,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory AddedData.fromJson(Map<String, dynamic> json) => _$AddedDataFromJson(json);

    Map<String, dynamic> toJson() => _$AddedDataToJson(this);
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
    List<String> category;
    @JsonKey(name: "sub_category")
    List<String> subCategory;
    @JsonKey(name: "description")
    String description;
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
        required this.description,
        required this.publish,
        required this.variants,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => _$ProductIdFromJson(json);

    Map<String, dynamic> toJson() => _$ProductIdToJson(this);
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
