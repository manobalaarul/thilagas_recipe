class RazorpayOrderEntity {
  final String id;
  final int amount;
  final String currency;
  final String receipt;
  final String status;

  const RazorpayOrderEntity({
    required this.id,
    required this.amount,
    required this.currency,
    required this.receipt,
    required this.status,
  });
}

class OrderEntity {
  final String orderId;
  final String userId;
  final List<OrderItemEntity> products;
  final String paymentId;
  final String paymentStatus;
  final String deliveryAddress;
  final double subTotalAmt;
  final double totalAmt;
  final DateTime createdAt;

  const OrderEntity({
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
}

class OrderItemEntity {
  final String productId;
  final String variantId;
  final ProductDetailsEntity productDetails;
  final VariantDetailsEntity variantDetails;
  final double price;
  final int qty;

  const OrderItemEntity({
    required this.productId,
    required this.variantId,
    required this.productDetails,
    required this.variantDetails,
    required this.price,
    required this.qty,
  });
}

class ProductDetailsEntity {
  final String name;
  final String image;

  const ProductDetailsEntity({
    required this.name,
    required this.image,
  });
}

class VariantDetailsEntity {
  final String name;

  const VariantDetailsEntity({
    required this.name,
  });
}
