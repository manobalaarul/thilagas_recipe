// To parse this JSON data, do
//
//     final productResponseEntity = productResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../variant/variant_entity.dart';

part 'product_response_entity.g.dart';

ProductResponseEntity productResponseEntityFromJson(String str) =>
    ProductResponseEntity.fromJson(json.decode(str));

String productResponseEntityToJson(ProductResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "totalCount")
  int totalCount;
  @JsonKey(name: "totalPages")
  int totalPages;
  @JsonKey(name: "data")
  List<Product> product;

  ProductResponseEntity({
    required this.message,
    required this.error,
    required this.success,
    required this.totalCount,
    required this.totalPages,
    required this.product,
  });

  factory ProductResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseEntityToJson(this);
}

@JsonSerializable()
class Product {
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
  @JsonKey(name: "more_details")
  Map<String, dynamic>? moreDetails;

  Product({
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
    this.moreDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
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

