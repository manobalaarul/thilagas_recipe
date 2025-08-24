// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductResponseEntity _$CategoryProductResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CategoryProductResponseEntity(
      message: json['message'] as String,
      product: (json['product'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$CategoryProductResponseEntityToJson(
        CategoryProductResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'product': instance.product,
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

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      name: $enumDecode(_$VariantNameEnumMap, json['name']),
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'name': _$VariantNameEnumMap[instance.name]!,
      'price': instance.price,
      'discount': instance.discount,
      'stock': instance.stock,
      '_id': instance.id,
    };

const _$VariantNameEnumMap = {
  VariantName.THE_100_G: '100g',
  VariantName.THE_1_KG: '1Kg',
  VariantName.THE_250_G: '250g',
  VariantName.THE_500_G: '500g',
  VariantName.THE_50_G: '50g',
};
