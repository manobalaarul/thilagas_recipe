// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseEntity _$CommonResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CommonResponseEntity(
      data: json['data'] as Map<String, dynamic>,
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$CommonResponseEntityToJson(
        CommonResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
    };
