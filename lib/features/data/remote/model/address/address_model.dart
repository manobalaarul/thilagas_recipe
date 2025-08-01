// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

import '../../../../domain/entities/address/address_response_entity.dart';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel extends AddressResponseEntity {
  AddressModel({
    required super.message,
    required super.error,
    required super.success,
    required super.address,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        message: json["message"],
        error: json["error"],
        success: json["success"],
        address:
            List<Address>.from(json["data"].map((x) => Address.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}
