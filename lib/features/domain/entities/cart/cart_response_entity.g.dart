// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseEntity _$CartResponseEntityFromJson(Map<String, dynamic> json) =>
    CartResponseEntity(
      cart: (json['data'] as List<dynamic>)
          .map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$CartResponseEntityToJson(CartResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.cart,
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      variant: Variant.fromJson(json['variant'] as Map<String, dynamic>),
      id: json['_id'] as String,
      productId: ProductId.fromJson(json['productId'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'variant': instance.variant,
      '_id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

ProductId _$ProductIdFromJson(Map<String, dynamic> json) => ProductId(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      subCategory: (json['sub_category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      publish: json['publish'] as bool,
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$ProductIdToJson(ProductId instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'publish': instance.publish,
      'variants': instance.variants,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      category: json['category'] as List<dynamic>?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'category': instance.category,
    };

