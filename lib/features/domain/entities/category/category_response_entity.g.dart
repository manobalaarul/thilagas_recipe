// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseEntity _$CategoryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CategoryResponseEntity(
      message: json['message'] as String,
      category: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$CategoryResponseEntityToJson(
        CategoryResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.category,
      'error': instance.error,
      'success': instance.success,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
