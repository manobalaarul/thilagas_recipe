// To parse this JSON data, do
//
//     final productResponseEntity = productResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_response_entity.g.dart';

ProductResponseEntity productResponseEntityFromJson(String str) => ProductResponseEntity.fromJson(json.decode(str));

String productResponseEntityToJson(ProductResponseEntity data) => json.encode(data.toJson());

@JsonSerializable()
class ProductResponseEntity {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "error")
    bool error;
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "totalCount")
    int totalCount;
    @JsonKey(name: "totalPages")
    int totalPages;
    @JsonKey(name: "product")
    List<Product> product;

    ProductResponseEntity({
        required this.message,
        required this.error,
        required this.success,
        required this.totalCount,
        required this.totalPages,
        required this.product,
    });

    factory ProductResponseEntity.fromJson(Map<String, dynamic> json) => _$ProductResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$ProductResponseEntityToJson(this);
}

@JsonSerializable()
class Product {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "image")
    List<String> image;
    @JsonKey(name: "category")
    List<Category> category;
    @JsonKey(name: "sub_category")
    List<Category> subCategory;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "publish")
    bool publish;
    @JsonKey(name: "variants")
    List<Variant> variants;
    @JsonKey(name: "createdAt")
    DateTime createdAt;
    @JsonKey(name: "updatedAt")
    DateTime updatedAt;
    @JsonKey(name: "__v")
    int v;
    @JsonKey(name: "more_details")
    MoreDetails? moreDetails;

    Product({
        required this.id,
        required this.name,
        required this.image,
        required this.category,
        required this.subCategory,
        required this.description,
        required this.publish,
        required this.variants,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.moreDetails,
    });

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Category {
    @JsonKey(name: "_id")
    Id id;
    @JsonKey(name: "name")
    Name name;
    @JsonKey(name: "image")
    String image;
    @JsonKey(name: "createdAt")
    DateTime createdAt;
    @JsonKey(name: "updatedAt")
    DateTime updatedAt;
    @JsonKey(name: "__v")
    int v;
    @JsonKey(name: "category")
    List<dynamic>? category;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.category,
    });

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

enum Id {
    @JsonValue("67f629697ebb4ec88aebf23c")
    THE_67_F629697_EBB4_EC88_AEBF23_C,
    @JsonValue("67f62c17aa2d697ded046ee0")
    THE_67_F62_C17_AA2_D697_DED046_EE0,
    @JsonValue("68559d0b5f71abe83a0c49be")
    THE_68559_D0_B5_F71_ABE83_A0_C49_BE
}

final idValues = EnumValues({
    "67f629697ebb4ec88aebf23c": Id.THE_67_F629697_EBB4_EC88_AEBF23_C,
    "67f62c17aa2d697ded046ee0": Id.THE_67_F62_C17_AA2_D697_DED046_EE0,
    "68559d0b5f71abe83a0c49be": Id.THE_68559_D0_B5_F71_ABE83_A0_C49_BE
});

enum Name {
    @JsonValue("Combo Offers")
    COMBO_OFFERS,
    @JsonValue("Homemade Masala")
    HOMEMADE_MASALA,
    @JsonValue("Masala")
    MASALA
}

final nameValues = EnumValues({
    "Combo Offers": Name.COMBO_OFFERS,
    "Homemade Masala": Name.HOMEMADE_MASALA,
    "Masala": Name.MASALA
});

@JsonSerializable()
class MoreDetails {
    @JsonKey(name: "Product Name")
    String productName;
    @JsonKey(name: "Brand")
    String brand;
    @JsonKey(name: "Net Weights")
    String netWeights;
    @JsonKey(name: "Shelf Life")
    String shelfLife;
    @JsonKey(name: "Storage Instructions")
    String storageInstructions;
    @JsonKey(name: "Usage")
    String usage;
    @JsonKey(name: "Flavor Profile")
    String? flavorProfile;
    @JsonKey(name: "Country of Origin")
    String countryOfOrigin;
    @JsonKey(name: "Certification")
    String certification;
    @JsonKey(name: "Flavour Profile")
    String? flavourProfile;

    MoreDetails({
        required this.productName,
        required this.brand,
        required this.netWeights,
        required this.shelfLife,
        required this.storageInstructions,
        required this.usage,
        this.flavorProfile,
        required this.countryOfOrigin,
        required this.certification,
        this.flavourProfile,
    });

    factory MoreDetails.fromJson(Map<String, dynamic> json) => _$MoreDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$MoreDetailsToJson(this);
}

@JsonSerializable()
class Variant {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "price")
    int price;
    @JsonKey(name: "discount")
    int discount;
    @JsonKey(name: "stock")
    int stock;
    @JsonKey(name: "_id")
    String id;

    Variant({
        required this.name,
        required this.price,
        required this.discount,
        required this.stock,
        required this.id,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

    Map<String, dynamic> toJson() => _$VariantToJson(this);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
