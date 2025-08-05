import 'dart:convert';

import '../../../../domain/entities/auth/auth_response_entity.dart';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({
    required super.message,
    required super.error,
    required super.success,
    required super.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        error: json["error"],
        success: json["success"],
        user: User.fromJson(json["data"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": user.toJson(),
      };
}
