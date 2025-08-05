import 'dart:convert';

import '../../../../domain/entities/auth/register/register_response_entity.dart';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel extends RegisterResponseEntity {
  RegisterResponseModel({
    required super.message,
    required super.error,
    required super.success,
    required super.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
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
