// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponseEntity _$SubCategoryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SubCategoryResponseEntity(
      message: json['message'] as String,
      subcategory: (json['data'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$SubCategoryResponseEntityToJson(
        SubCategoryResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.subcategory,
      'error': instance.error,
      'success': instance.success,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      category: (json['category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
