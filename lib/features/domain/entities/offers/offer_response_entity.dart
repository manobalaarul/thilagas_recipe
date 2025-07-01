// To parse this JSON data, do
//
//     final offerResponseEntity = offerResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'offer_response_entity.g.dart';

OfferResponseEntity offerResponseEntityFromJson(String str) =>
    OfferResponseEntity.fromJson(json.decode(str));

String offerResponseEntityToJson(OfferResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class OfferResponseEntity {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "data")
  Offer offer;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  OfferResponseEntity({
    required this.message,
    required this.offer,
    required this.error,
    required this.success,
  });

  factory OfferResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OfferResponseEntityToJson(this);
}

@JsonSerializable()
class Offer {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "image1")
  String image1;
  @JsonKey(name: "image2")
  String image2;
  @JsonKey(name: "image3")
  String image3;
  @JsonKey(name: "topic")
  String topic;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "start_time")
  DateTime startTime;
  @JsonKey(name: "end_time")
  DateTime endTime;
  @JsonKey(name: "offer_image")
  String offerImage;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  Offer({
    required this.id,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.topic,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.offerImage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
