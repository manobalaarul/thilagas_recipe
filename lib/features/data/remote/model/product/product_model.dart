import 'dart:convert';

import '../../../../domain/entities/product/product_response_entity.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends ProductResponseEntity {
  ProductModel({
    required super.message,
    required super.error,
    required super.success,
    required super.totalCount,
    required super.totalPages,
    required super.product,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        message: json["message"],
        error: json["error"],
        success: json["success"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "totalCount": totalCount,
        "totalPages": totalPages,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}
