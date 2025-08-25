import 'dart:convert';

import '../../../../domain/entities/product/product_entity.dart';
import '../../../../domain/entities/product/search_product_response_entity.dart';

SearchProductModel productModelFromJson(String str) =>
    SearchProductModel.fromJson(json.decode(str));

String productModelToJson(SearchProductModel data) =>
    json.encode(data.toJson());

class SearchProductModel extends SearchProductResponseEntity {
  SearchProductModel({
    required super.message,
    required super.error,
    required super.success,
    required super.totalCount,
    required super.totalPages,
    required super.product,
    required super.page,
    required super.limit,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        message: json["message"],
        error: json["error"],
        success: json["success"],
        totalCount: json["totalCount"],
        totalPages: json["totalPage"],
        product:
            List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "totalCount": totalCount,
        "totalPage": totalPages,
        "page": page,
        "limit": limit,
        "data": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}
