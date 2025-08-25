// To parse this JSON data, do
//
//     final searchProductResponseEntity = searchProductResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:thilagas_recipe/features/domain/entities/product/product_entity.dart';
import 'package:thilagas_recipe/features/domain/entities/product/product_response_entity.dart';

import '../variant/variant_entity.dart';

part 'search_product_response_entity.g.dart';

SearchProductResponseEntity searchProductResponseEntityFromJson(String str) =>
    SearchProductResponseEntity.fromJson(json.decode(str));

String searchProductResponseEntityToJson(SearchProductResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SearchProductResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "data")
  List<Product> product;
  @JsonKey(name: "totalCount")
  int totalCount;
  @JsonKey(name: "totalPage")
  int totalPages;
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "limit")
  int limit;

  SearchProductResponseEntity({
    required this.message,
    required this.error,
    required this.success,
    required this.product,
    required this.totalCount,
    required this.totalPages,
    required this.page,
    required this.limit,
  });

  factory SearchProductResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseEntityToJson(this);
}

@JsonSerializable()
class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
