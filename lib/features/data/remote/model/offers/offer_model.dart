import 'dart:convert';

import '../../../../domain/entities/offers/offer_response_entity.dart';

OfferModel offerModelFromJson(String str) =>
    OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel extends OfferResponseEntity {
  OfferModel({
    required super.message,
    required super.offer,
    required super.error,
    required super.success,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        message: json["message"],
        offer: Offer.fromJson(json["data"]),
        error: json["error"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "offer": offer.toJson(),
        "error": error,
        "success": success,
      };
}
