// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferResponseEntity _$OfferResponseEntityFromJson(Map<String, dynamic> json) =>
    OfferResponseEntity(
      message: json['message'] as String,
      offer: Offer.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as bool,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$OfferResponseEntityToJson(
        OfferResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.offer,
      'error': instance.error,
      'success': instance.success,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: json['_id'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      topic: json['topic'] as String,
      title: json['title'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      offerImage: json['offer_image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      '_id': instance.id,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'topic': instance.topic,
      'title': instance.title,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'offer_image': instance.offerImage,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
