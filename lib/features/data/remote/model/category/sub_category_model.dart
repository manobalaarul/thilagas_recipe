import 'dart:convert';

import '../../../../domain/entities/category/sub_category_response_entity.dart';

SubCategoryModel categoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String categoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel extends SubCategoryResponseEntity {
  SubCategoryModel({
    required super.message,
    required super.subcategory,
    required super.error,
    required super.success,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        message: json["message"],
        subcategory: List<SubCategory>.from(
            json["data"].map((x) => SubCategory.fromJson(x))),
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(subcategory.map((x) => x.toJson())),
        "error": error,
        "success": success,
      };
}
