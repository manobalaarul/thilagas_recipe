// To parse this JSON data, do
//
//     final addressResponseEntity = addressResponseEntityFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'address_response_entity.g.dart';

AddressResponseEntity addressResponseEntityFromJson(String str) => AddressResponseEntity.fromJson(json.decode(str));

String addressResponseEntityToJson(AddressResponseEntity data) => json.encode(data.toJson());

@JsonSerializable()
class AddressResponseEntity {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "error")
    bool error;
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "Address")
    List<Address> address;

    AddressResponseEntity({
        required this.message,
        required this.error,
        required this.success,
        required this.address,
    });

    factory AddressResponseEntity.fromJson(Map<String, dynamic> json) => _$AddressResponseEntityFromJson(json);

    Map<String, dynamic> toJson() => _$AddressResponseEntityToJson(this);
}

@JsonSerializable()
class Address {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "address_line")
    String addressLine;
    @JsonKey(name: "city")
    String city;
    @JsonKey(name: "state")
    String state;
    @JsonKey(name: "pincode")
    String pincode;
    @JsonKey(name: "country")
    String country;
    @JsonKey(name: "mobile")
    String mobile;
    @JsonKey(name: "status")
    bool status;
    @JsonKey(name: "userId")
    String userId;
    @JsonKey(name: "createdAt")
    DateTime createdAt;
    @JsonKey(name: "updatedAt")
    DateTime updatedAt;
    @JsonKey(name: "__v")
    int v;

    Address({
        required this.id,
        required this.addressLine,
        required this.city,
        required this.state,
        required this.pincode,
        required this.country,
        required this.mobile,
        required this.status,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

    Map<String, dynamic> toJson() => _$AddressToJson(this);
}
