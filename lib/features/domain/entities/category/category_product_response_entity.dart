// To parse this JSON data, do
//
//     final categoryProductResponseEntity = categoryProductResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../product/product_entity.dart';

part 'category_product_response_entity.g.dart';

CategoryProductResponseEntity categoryProductResponseEntityFromJson(
        String str) =>
    CategoryProductResponseEntity.fromJson(json.decode(str));

String categoryProductResponseEntityToJson(
        CategoryProductResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CategoryProductResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "product")
  List<Product> product;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  CategoryProductResponseEntity({
    required this.message,
    required this.product,
    required this.error,
    required this.success,
  });

  factory CategoryProductResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductResponseEntityToJson(this);
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

@JsonSerializable()
class Variant {
  @JsonKey(name: "name")
  VariantName name;
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

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

enum VariantName {
  @JsonValue("100g")
  THE_100_G,
  @JsonValue("1Kg")
  THE_1_KG,
  @JsonValue("250g")
  THE_250_G,
  @JsonValue("500g")
  THE_500_G,
  @JsonValue("50g")
  THE_50_G
}

final variantNameValues = EnumValues({
  "100g": VariantName.THE_100_G,
  "1Kg": VariantName.THE_1_KG,
  "250g": VariantName.THE_250_G,
  "500g": VariantName.THE_500_G,
  "50g": VariantName.THE_50_G
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
