import 'package:json_annotation/json_annotation.dart';
import 'product_response_entity.dart';
import '../variant/variant_entity.dart';

part 'product_entity.g.dart';

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
  Map<String, dynamic>? moreDetails;

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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
