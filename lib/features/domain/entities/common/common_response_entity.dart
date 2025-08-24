import 'dart:convert';

import 'package:flutter/src/widgets/basic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response_entity.g.dart';

CommonResponseEntity commonResponseEntityFromJson(String str) =>
    CommonResponseEntity.fromJson(json.decode(str));

String commonResponseEntityToJson(CommonResponseEntity data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CommonResponseEntity {
  @JsonKey(name: "data")
  Map<String, dynamic> data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "error")
  bool error;
  @JsonKey(name: "success")
  bool success;

  CommonResponseEntity({
    required this.data,
    required this.message,
    required this.error,
    required this.success,
  });

  factory CommonResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseEntityToJson(this);

  map(SizedBox Function(dynamic product) param0) {}
}
