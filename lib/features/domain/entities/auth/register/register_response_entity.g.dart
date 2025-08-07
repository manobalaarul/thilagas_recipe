// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseEntity _$RegisterResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseEntity(
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseEntityToJson(
        RegisterResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
      'data': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
      mobile: json['mobile'],
      gstNo: json['gstNo'],
      refreshToken: json['refresh_token'] as String,
      verifyEmail: json['verify_email'] as bool,
      lastLoginDate: json['last_login_date'],
      status: json['status'] as String,
      addressDetails: json['address_details'] as List<dynamic>,
      shoppingCart: json['shopping_cart'] as List<dynamic>,
      wishlist: json['wishlist'] as List<dynamic>,
      blogs: json['blogs'] as List<dynamic>,
      orderHistory: json['order_history'] as List<dynamic>,
      role: json['role'] as String,
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'mobile': instance.mobile,
      'gstNo': instance.gstNo,
      'refresh_token': instance.refreshToken,
      'verify_email': instance.verifyEmail,
      'last_login_date': instance.lastLoginDate,
      'status': instance.status,
      'address_details': instance.addressDetails,
      'shopping_cart': instance.shoppingCart,
      'wishlist': instance.wishlist,
      'blogs': instance.blogs,
      'order_history': instance.orderHistory,
      'role': instance.role,
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
