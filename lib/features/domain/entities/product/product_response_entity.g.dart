// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseEntity _$ProductResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ProductResponseEntity(
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      product: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseEntityToJson(
        ProductResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      subCategory: (json['sub_category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      publish: json['publish'] as bool,
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      moreDetails: json['more_details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
      'more_details': instance.moreDetails,
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
