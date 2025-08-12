// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistResponseEntity _$WishlistResponseEntityFromJson(
        Map<String, dynamic> json) =>
    WishlistResponseEntity(
      message: json['message'] as String,
      wishlist: (json['wishlist'] as List<dynamic>)
          .map((e) => Wishlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$WishlistResponseEntityToJson(
        WishlistResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'wishlist': instance.wishlist,
      'error': instance.error,
      'success': instance.success,
    };

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
      id: json['_id'] as String,
      productId: ProductId.fromJson(json['productId'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
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
      moreDetails: json['more_details'] == null
          ? null
          : MoreDetails.fromJson(json['more_details'] as Map<String, dynamic>),
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

MoreDetails _$MoreDetailsFromJson(Map<String, dynamic> json) => MoreDetails(
      productName: json['Product Name'] as String,
      brand: json['Brand'] as String,
      shelfLife: json['Shelf Life'] as String,
      storageInstructions: json['Storage Instructions'] as String,
      usage: json['Usage'] as String,
      flavorProfile: json['Flavor Profile'] as String,
      countryOfOrigin: json['Country of Origin'] as String,
      certification: json['Certification'] as String,
      netWeights: json['Net Weights'] as String,
    );

Map<String, dynamic> _$MoreDetailsToJson(MoreDetails instance) =>
    <String, dynamic>{
      'Product Name': instance.productName,
      'Brand': instance.brand,
      'Shelf Life': instance.shelfLife,
      'Storage Instructions': instance.storageInstructions,
      'Usage': instance.usage,
      'Flavor Profile': instance.flavorProfile,
      'Country of Origin': instance.countryOfOrigin,
      'Certification': instance.certification,
      'Net Weights': instance.netWeights,
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
