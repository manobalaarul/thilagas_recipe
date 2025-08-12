import 'dart:convert';

CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) =>
    json.encode(data.toJson());

class CommonResponseModel {
  Map<String, dynamic> data;
  String message;
  bool error;
  bool success;

  CommonResponseModel({
    required this.data,
    required this.message,
    required this.error,
    required this.success,
  });

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        data: json["data"],
        message: json["message"],
        error: json["error"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "error": error,
        "success": success,
      };
}
