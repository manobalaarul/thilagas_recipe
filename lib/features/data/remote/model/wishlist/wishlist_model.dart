import 'dart:convert';

import '../../../../domain/entities/wishlist/get/wishlist_response_entity.dart';

WishlistModel wishlistModelFromJson(String str) =>
    WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel extends WishlistResponseEntity {
  WishlistModel({
    required super.message,
    required super.wishlist,
    required super.error,
    required super.success,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        message: json["message"],
        wishlist:
            List<Wishlist>.from(json["data"].map((x) => Wishlist.fromJson(x))),
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(wishlist.map((x) => x.toJson())),
        "error": error,
        "success": success,
      };
}
