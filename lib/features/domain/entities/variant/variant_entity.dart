import 'package:json_annotation/json_annotation.dart';

part 'variant_entity.g.dart';

@JsonSerializable()
class Variant {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "discount")
  int discount;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "_id")
  String id;

  Variant({
    required this.name,
    required this.price,
    required this.discount,
    this.stock,
    required this.id,
  });

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}
