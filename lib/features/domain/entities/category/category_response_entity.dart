// To parse this JSON data, do
//
//     final categoryResponseEntity = categoryResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:thilagas_recipe/features/presentation/screens/home/widgets/category/category_card.dart';

part 'category_response_entity.g.dart';

CategoryResponseEntity categoryResponseEntityFromJson(String str) =>
    CategoryResponseEntity.fromJson(json.decode(str));

String categoryResponseEntityToJson(CategoryResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CategoryResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "data")
  List<Category> category;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  CategoryResponseEntity({
    required this.message,
    required this.category,
    required this.error,
    required this.success,
  });

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseEntityToJson(this);
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

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  map(CategoryCard Function(dynamic category) param0) {}
}
