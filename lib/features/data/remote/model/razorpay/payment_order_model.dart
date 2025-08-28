import 'package:equatable/equatable.dart';

class PaymentOrderModel extends Equatable {
  final String orderId;
  final String userId;
  final List<OrderItemModel> products;
  final String paymentId;
  final String paymentStatus;
  final String deliveryAddress;
  final double subTotalAmt;
  final double totalAmt;
  final DateTime createdAt;

  const PaymentOrderModel({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.paymentId,
    required this.paymentStatus,
    required this.deliveryAddress,
    required this.subTotalAmt,
    required this.totalAmt,
    required this.createdAt,
  });

  factory PaymentOrderModel.fromJson(Map<String, dynamic> json) {
    return PaymentOrderModel(
      orderId: json['order_id'] ?? '',
      userId: json['user_id'] ?? '',
      products: (json['products'] as List?)
              ?.map((item) => OrderItemModel.fromJson(item))
              .toList() ??
          [],
      paymentId: json['payment_id'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      subTotalAmt: (json['sub_total_amt'] ?? 0).toDouble(),
      totalAmt: (json['total_amt'] ?? 0).toDouble(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
        orderId,
        userId,
        products,
        paymentId,
        paymentStatus,
        deliveryAddress,
        subTotalAmt,
        totalAmt,
        createdAt,
      ];
}

class OrderItemModel extends Equatable {
  final String productId;
  final String variantId;
  final ProductDetailsModel productDetails;
  final VariantDetailsModel variantDetails;
  final double price;
  final int qty;

  const OrderItemModel({
    required this.productId,
    required this.variantId,
    required this.productDetails,
    required this.variantDetails,
    required this.price,
    required this.qty,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['product_id'] ?? '',
      variantId: json['variant_id'] ?? '',
      productDetails:
          ProductDetailsModel.fromJson(json['product_details'] ?? {}),
      variantDetails:
          VariantDetailsModel.fromJson(json['variant_details'] ?? {}),
      price: (json['price'] ?? 0).toDouble(),
      qty: json['qty'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        variantId,
        productDetails,
        variantDetails,
        price,
        qty,
      ];
}

class ProductDetailsModel extends Equatable {
  final String name;
  final String image;

  const ProductDetailsModel({
    required this.name,
    required this.image,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  @override
  List<Object?> get props => [name, image];
}

class VariantDetailsModel extends Equatable {
  final String name;

  const VariantDetailsModel({
    required this.name,
  });

  factory VariantDetailsModel.fromJson(Map<String, dynamic> json) {
    return VariantDetailsModel(
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [name];
}
