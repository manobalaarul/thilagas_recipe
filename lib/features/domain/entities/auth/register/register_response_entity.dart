// To parse this JSON data, do
//
//     final registerResponseEntity = registerResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'register_response_entity.g.dart';

RegisterResponseEntity registerResponseEntityFromJson(String str) =>
    RegisterResponseEntity.fromJson(json.decode(str));

String registerResponseEntityToJson(RegisterResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class RegisterResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "data")
  User user;

  RegisterResponseEntity({
    required this.message,
    required this.error,
    required this.success,
    required this.user,
  });

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseEntityToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "mobile")
  dynamic mobile;
  @JsonKey(name: "gstNo")
  dynamic gstNo;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "verify_email")
  bool verifyEmail;
  @JsonKey(name: "last_login_date")
  dynamic lastLoginDate;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "address_details")
  List<dynamic> addressDetails;
  @JsonKey(name: "shopping_cart")
  List<dynamic> shoppingCart;
  @JsonKey(name: "wishlist")
  List<dynamic> wishlist;
  @JsonKey(name: "blogs")
  List<dynamic> blogs;
  @JsonKey(name: "order_history")
  List<dynamic> orderHistory;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.mobile,
    required this.gstNo,
    required this.refreshToken,
    required this.verifyEmail,
    required this.lastLoginDate,
    required this.status,
    required this.addressDetails,
    required this.shoppingCart,
    required this.wishlist,
    required this.blogs,
    required this.orderHistory,
    required this.role,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
