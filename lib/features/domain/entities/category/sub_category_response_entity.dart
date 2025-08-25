// To parse this JSON data, do
//
//     final subCategoryResponseEntity = subCategoryResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'category_response_entity.dart';

part 'sub_category_response_entity.g.dart';

SubCategoryResponseEntity subCategoryResponseEntityFromJson(String str) =>
    SubCategoryResponseEntity.fromJson(json.decode(str));

String subCategoryResponseEntityToJson(SubCategoryResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SubCategoryResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "data")
  List<SubCategory> subcategory;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  SubCategoryResponseEntity({
    required this.message,
    required this.subcategory,
    required this.error,
    required this.success,
  });

  factory SubCategoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryResponseEntityToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "category")
  List<Category> category;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
