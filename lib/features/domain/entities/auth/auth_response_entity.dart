// To parse this JSON data, do
//
//     final authResponseEntity = authResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_response_entity.g.dart';

AuthResponseEntity authResponseEntityFromJson(String str) =>
    AuthResponseEntity.fromJson(json.decode(str));

String authResponseEntityToJson(AuthResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AuthResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "data")
  User user;

  AuthResponseEntity({
    required this.message,
    required this.error,
    required this.success,
    required this.user,
  });

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseEntityToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "accessToken")
  String accessToken;
  @JsonKey(name: "refreshToken")
  String refreshToken;
  @JsonKey(name: "user")
  UserDetails userDetails;

  User({
    required this.accessToken,
    required this.refreshToken,
    required this.userDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserDetails {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "mobile", defaultValue: 0)
  int? mobile;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "verify_email")
  bool verifyEmail;
  @JsonKey(name: "last_login_date")
  DateTime lastLoginDate;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "address_details")
  List<String> addressDetails;
  @JsonKey(name: "shopping_cart")
  List<String> shoppingCart;
  @JsonKey(name: "wishlist")
  List<String> wishlist;
  @JsonKey(name: "order_history")
  List<dynamic> orderHistory;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "__v")
  int v;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "blogs")
  List<String> blogs;
  @JsonKey(name: "gstNo")
  String gstNo;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.mobile,
    required this.refreshToken,
    required this.verifyEmail,
    required this.lastLoginDate,
    required this.status,
    required this.addressDetails,
    required this.shoppingCart,
    required this.wishlist,
    required this.orderHistory,
    required this.role,
    required this.v,
    required this.updatedAt,
    required this.blogs,
    required this.gstNo,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
