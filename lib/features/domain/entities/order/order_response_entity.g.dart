// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseEntity _$OrderResponseEntityFromJson(Map<String, dynamic> json) =>
    OrderResponseEntity(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$OrderResponseEntityToJson(
        OrderResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
      'success': instance.success,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      orderId: json['orderId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentId: json['paymentId'] as String,
      paymentStatus: json['payment_status'] as String,
      deliveryAddress: DeliveryAddress.fromJson(
          json['delivery_address'] as Map<String, dynamic>),
      deliveryCharge: (json['delivery_charge'] as num).toInt(),
      subTotalAmt: (json['subTotalAmt'] as num).toInt(),
      totalAmt: (json['totalAmt'] as num).toDouble(),
      gst: (json['gst'] as num).toDouble(),
      isGst: json['isGst'] as bool,
      invoiceReceipt: json['invoice_receipt'] as String,
      orderStatus: json['order_status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deliveryStatus: (json['delivery_status'] as List<dynamic>)
          .map((e) => DeliveryStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'orderId': instance.orderId,
      'products': instance.products,
      'paymentId': instance.paymentId,
      'payment_status': instance.paymentStatus,
      'delivery_address': instance.deliveryAddress,
      'delivery_charge': instance.deliveryCharge,
      'subTotalAmt': instance.subTotalAmt,
      'totalAmt': instance.totalAmt,
      'gst': instance.gst,
      'isGst': instance.isGst,
      'invoice_receipt': instance.invoiceReceipt,
      'order_status': instance.orderStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      'delivery_status': instance.deliveryStatus,
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    DeliveryAddress(
      id: json['_id'] as String,
      addressLine: json['address_line'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      country: json['country'] as String,
      mobile: (json['mobile'] as num).toInt(),
      status: json['status'] as bool,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$DeliveryAddressToJson(DeliveryAddress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'address_line': instance.addressLine,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'country': instance.country,
      'mobile': instance.mobile,
      'status': instance.status,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

DeliveryStatus _$DeliveryStatusFromJson(Map<String, dynamic> json) =>
    DeliveryStatus(
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$DeliveryStatusToJson(DeliveryStatus instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'updatedAt': instance.updatedAt.toIso8601String(),
      '_id': instance.id,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productDetails: ProductDetails.fromJson(
          json['product_details'] as Map<String, dynamic>),
      variantDetails: VariantDetails.fromJson(
          json['variant_details'] as Map<String, dynamic>),
      productId: json['productId'] as String,
      variantId: json['variantId'] as String,
      price: (json['price'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_details': instance.productDetails,
      'variant_details': instance.variantDetails,
      'productId': instance.productId,
      'variantId': instance.variantId,
      'price': instance.price,
      'qty': instance.qty,
      '_id': instance.id,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

VariantDetails _$VariantDetailsFromJson(Map<String, dynamic> json) =>
    VariantDetails(
      name: json['name'] as String,
    );

Map<String, dynamic> _$VariantDetailsToJson(VariantDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
