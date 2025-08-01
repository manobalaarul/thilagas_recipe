import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    String message;
    List<Datum> data;
    bool error;
    bool success;

    OrderModel({
        required this.message,
        required this.data,
        required this.error,
        required this.success,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
        "success": success,
    };
}