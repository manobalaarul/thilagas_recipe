import 'dart:convert';
import '../../../../domain/entities/category/category_response_entity.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryResponseEntity {
  CategoryModel({
    required super.message,
    required super.category,
    required super.error,
    required super.success,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        message: json["message"],
        category:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
        error: json["error"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(category.map((x) => x.toJson())),
        "error": error,
        "success": success,
      };
}
