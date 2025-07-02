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
      product: (json['product'] as List<dynamic>)
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
      'product': instance.product,
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
      moreDetails: json['more_details'] == null
          ? null
          : MoreDetails.fromJson(json['more_details'] as Map<String, dynamic>),
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
      id: $enumDecode(_$IdEnumMap, json['_id']),
      name: $enumDecode(_$NameEnumMap, json['name']),
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      category: json['category'] as List<dynamic>?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': _$IdEnumMap[instance.id]!,
      'name': _$NameEnumMap[instance.name]!,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'category': instance.category,
    };

const _$IdEnumMap = {
  Id.THE_67_F629697_EBB4_EC88_AEBF23_C: '67f629697ebb4ec88aebf23c',
  Id.THE_67_F62_C17_AA2_D697_DED046_EE0: '67f62c17aa2d697ded046ee0',
  Id.THE_68559_D0_B5_F71_ABE83_A0_C49_BE: '68559d0b5f71abe83a0c49be',
};

const _$NameEnumMap = {
  Name.COMBO_OFFERS: 'Combo Offers',
  Name.HOMEMADE_MASALA: 'Homemade Masala',
  Name.MASALA: 'Masala',
};

MoreDetails _$MoreDetailsFromJson(Map<String, dynamic> json) => MoreDetails(
      productName: json['Product Name'] as String,
      brand: json['Brand'] as String,
      netWeights: json['Net Weights'] as String,
      shelfLife: json['Shelf Life'] as String,
      storageInstructions: json['Storage Instructions'] as String,
      usage: json['Usage'] as String,
      flavorProfile: json['Flavor Profile'] as String?,
      countryOfOrigin: json['Country of Origin'] as String,
      certification: json['Certification'] as String,
      flavourProfile: json['Flavour Profile'] as String?,
    );

Map<String, dynamic> _$MoreDetailsToJson(MoreDetails instance) =>
    <String, dynamic>{
      'Product Name': instance.productName,
      'Brand': instance.brand,
      'Net Weights': instance.netWeights,
      'Shelf Life': instance.shelfLife,
      'Storage Instructions': instance.storageInstructions,
      'Usage': instance.usage,
      'Flavor Profile': instance.flavorProfile,
      'Country of Origin': instance.countryOfOrigin,
      'Certification': instance.certification,
      'Flavour Profile': instance.flavourProfile,
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
