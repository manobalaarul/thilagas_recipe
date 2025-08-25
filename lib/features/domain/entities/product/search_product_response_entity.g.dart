// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductResponseEntity _$SearchProductResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SearchProductResponseEntity(
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
      product: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPage'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$SearchProductResponseEntityToJson(
        SearchProductResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
      'data': instance.product,
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPages,
      'page': instance.page,
      'limit': instance.limit,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
