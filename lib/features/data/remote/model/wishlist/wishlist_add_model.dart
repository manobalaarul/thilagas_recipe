import 'dart:convert';

import 'package:thilagas_recipe/features/domain/entities/wishlist/add/wishlist_add_response_entity.dart';

WishlistAddModel wishlistAddModelFromJson(String str) =>
    WishlistAddModel.fromJson(json.decode(str));

String wishlistAddModelToJson(WishlistAddModel data) =>
    json.encode(data.toJson());

class WishlistAddModel extends WishlistAddResponseEntity {
  WishlistAddModel({
    required super.message,
    required super.addedData,
    required super.error,
    required super.success,
  });

  factory WishlistAddModel.fromJson(Map<String, dynamic> json) =>
      WishlistAddModel(
        message: json["message"],
        addedData: AddedData.fromJson(json["added_data"]),
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "added_data": addedData.toJson(),
        "error": error,
        "success": success,
      };
}
