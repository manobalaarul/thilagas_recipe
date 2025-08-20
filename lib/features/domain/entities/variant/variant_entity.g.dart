// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'discount': instance.discount,
      'stock': instance.stock,
      '_id': instance.id,
    };
