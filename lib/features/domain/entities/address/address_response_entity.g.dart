// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseEntity _$AddressResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddressResponseEntity(
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
      address: (json['data'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseEntityToJson(
        AddressResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
      'data': instance.address,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['_id'] as String,
      addressLine: json['address_line'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      country: json['country'] as String,
      mobile: json['mobile'].toString(),
      status: json['status'] as bool,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      '_id': instance.id,
      'address_line': instance.addressLine,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'country': instance.country,
      'mobile': instance.mobile,
      'status': instance.status,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
