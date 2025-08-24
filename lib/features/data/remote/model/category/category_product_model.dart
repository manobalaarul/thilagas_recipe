import 'dart:convert';

import 'package:thilagas_recipe/features/domain/entities/category/category_product_response_entity.dart';

import '../../../../domain/entities/product/product_entity.dart';
import '../../../../domain/entities/product/product_response_entity.dart'
    hide Product;

CategoryProductModel CategoryProductModelFromJson(String str) =>
    CategoryProductModel.fromJson(json.decode(str));

String CategoryProductModelToJson(CategoryProductModel data) =>
    json.encode(data.toJson());

class CategoryProductModel extends CategoryProductResponseEntity {
  CategoryProductModel({
    required super.message,
    required super.error,
    required super.success,
    required super.product,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductModel(
        message: json["message"],
        error: json["error"],
        success: json["success"],
        product:
            List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}
