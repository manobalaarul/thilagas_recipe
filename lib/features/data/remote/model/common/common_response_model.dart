import 'dart:convert';

import '../../../../domain/entities/common/common_response_entity.dart';

CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) =>
    json.encode(data.toJson());

class CommonResponseModel extends CommonResponseEntity {
  CommonResponseModel({
    required super.data,
    required super.message,
    required super.error,
    required super.success,
  });

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        data: json["data"],
        message: json["message"],
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "error": error,
        "success": success,
      };
}
