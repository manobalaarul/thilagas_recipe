// To parse this JSON data, do
//
//     final orderResponseEntity = orderResponseEntityFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'order_response_entity.g.dart';

OrderResponseEntity orderResponseEntityFromJson(String str) =>
    OrderResponseEntity.fromJson(json.decode(str));

String orderResponseEntityToJson(OrderResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class OrderResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "data")
  List<Order> order;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  OrderResponseEntity({
    required this.message,
    required this.order,
    required this.error,
    required this.success,
  });

  factory OrderResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseEntityToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "userId")
  UserId userId;
  @JsonKey(name: "orderId")
  String orderId;
  @JsonKey(name: "products")
  List<Product> products;
  @JsonKey(name: "paymentId")
  String paymentId;
  @JsonKey(name: "payment_status")
  String paymentStatus;
  @JsonKey(name: "delivery_address")
  DeliveryAddress deliveryAddress;
  @JsonKey(name: "delivery_charge")
  int deliveryCharge;
  @JsonKey(name: "subTotalAmt")
  int subTotalAmt;
  @JsonKey(name: "totalAmt")
  double totalAmt;
  @JsonKey(name: "gst")
  double gst;
  @JsonKey(name: "isGst")
  bool isGst;
  @JsonKey(name: "invoice_receipt")
  String invoiceReceipt;
  @JsonKey(name: "order_status")
  String orderStatus;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "delivery_status")
  List<DeliveryStatus> deliveryStatus;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  Order({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.products,
    required this.paymentId,
    required this.paymentStatus,
    required this.deliveryAddress,
    required this.deliveryCharge,
    required this.subTotalAmt,
    required this.totalAmt,
    required this.gst,
    required this.isGst,
    required this.invoiceReceipt,
    required this.orderStatus,
    required this.createdAt,
    required this.deliveryStatus,
    required this.updatedAt,
    required this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class DeliveryAddress {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "address_line")
  String addressLine;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "pincode")
  String pincode;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "mobile")
  int mobile;
  @JsonKey(name: "status")
  bool status;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  DeliveryAddress({
    required this.id,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.mobile,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryAddressToJson(this);
}

@JsonSerializable()
class DeliveryStatus {
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "_id")
  String id;

  DeliveryStatus({
    required this.title,
    required this.description,
    required this.updatedAt,
    required this.id,
  });

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryStatusToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "product_details")
  ProductDetails productDetails;
  @JsonKey(name: "variant_details")
  VariantDetails variantDetails;
  @JsonKey(name: "productId")
  String productId;
  @JsonKey(name: "variantId")
  String variantId;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "qty")
  int qty;
  @JsonKey(name: "_id")
  String id;

  Product({
    required this.productDetails,
    required this.variantDetails,
    required this.productId,
    required this.variantId,
    required this.price,
    required this.qty,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductDetails {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;

  ProductDetails({
    required this.name,
    required this.image,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}

@JsonSerializable()
class VariantDetails {
  @JsonKey(name: "name")
  String name;

  VariantDetails({
    required this.name,
  });

  factory VariantDetails.fromJson(Map<String, dynamic> json) =>
      _$VariantDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VariantDetailsToJson(this);
}

@JsonSerializable()
class UserId {
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
  @JsonKey(name: "mobile")
  int mobile;
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

  UserId({
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

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);
}
