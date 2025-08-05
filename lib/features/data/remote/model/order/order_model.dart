import 'dart:convert';
import '../../../../domain/entities/order/order_response_entity.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel extends OrderResponseEntity {
  OrderModel({
    required super.message,
    required super.order,
    required super.error,
    required super.success,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        message: json["message"],
        order: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
        error: json["error"],
        success: json["success"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(order.map((x) => x.toJson())),
        "error": error,
        "success": success,
      };
}
