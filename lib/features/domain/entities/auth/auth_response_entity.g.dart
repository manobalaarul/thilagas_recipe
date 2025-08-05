// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseEntity _$AuthResponseEntityFromJson(Map<String, dynamic> json) =>
    AuthResponseEntity(
      message: json['message'] as String,
      error: json['error'] as bool,
      success: json['success'] as bool,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseEntityToJson(AuthResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'success': instance.success,
      'data': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userDetails: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.userDetails,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatar: json['avatar'] as String,
      mobile: (json['mobile'] as num).toInt(),
      refreshToken: json['refresh_token'] as String,
      verifyEmail: json['verify_email'] as bool,
      lastLoginDate: DateTime.parse(json['last_login_date'] as String),
      status: json['status'] as String,
      addressDetails: (json['address_details'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shoppingCart: (json['shopping_cart'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      wishlist:
          (json['wishlist'] as List<dynamic>).map((e) => e as String).toList(),
      orderHistory: json['order_history'] as List<dynamic>,
      role: json['role'] as String,
      v: (json['__v'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      blogs: (json['blogs'] as List<dynamic>).map((e) => e as String).toList(),
      gstNo: json['gstNo'] as String,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'mobile': instance.mobile,
      'refresh_token': instance.refreshToken,
      'verify_email': instance.verifyEmail,
      'last_login_date': instance.lastLoginDate.toIso8601String(),
      'status': instance.status,
      'address_details': instance.addressDetails,
      'shopping_cart': instance.shoppingCart,
      'wishlist': instance.wishlist,
      'order_history': instance.orderHistory,
      'role': instance.role,
      '__v': instance.v,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'blogs': instance.blogs,
      'gstNo': instance.gstNo,
    };
