// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_add_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistAddResponseEntity _$WishlistAddResponseEntityFromJson(
        Map<String, dynamic> json) =>
    WishlistAddResponseEntity(
      message: json['message'] as String,
      addedData: AddedData.fromJson(json['added_data'] as Map<String, dynamic>),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$WishlistAddResponseEntityToJson(
        WishlistAddResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'added_data': instance.addedData,
      'error': instance.error,
      'success': instance.success,
    };

AddedData _$AddedDataFromJson(Map<String, dynamic> json) => AddedData(
      id: json['_id'] as String,
      productId: ProductId.fromJson(json['productId'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$AddedDataToJson(AddedData instance) => <String, dynamic>{
      '_id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

ProductId _$ProductIdFromJson(Map<String, dynamic> json) => ProductId(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      subCategory: (json['sub_category'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
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
      'description': instance.description,
      'publish': instance.publish,
      'variants': instance.variants,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'stock': instance.stock,
      '_id': instance.id,
    };
