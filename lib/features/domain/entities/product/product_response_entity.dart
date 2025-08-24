// To parse this JSON data, do
//
//     final productResponseEntity = productResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/widgets/basic.dart';
import 'package:json_annotation/json_annotation.dart';

import '../variant/variant_entity.dart';
import 'product_entity.dart';

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

  map(SizedBox Function(dynamic product) param0) {}
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

