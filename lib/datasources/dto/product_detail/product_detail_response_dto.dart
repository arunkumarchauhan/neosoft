import 'dart:convert';

import 'package:neostore/datasources/dto/product_detail/product_detail_dto.dart';

class ProductDetailResponseDTO {
  ProductDetailResponseDTO(
      {this.status, this.productDetailDTO, this.message, this.userMessage});
  String? message;
  String? userMessage;
  int? status;
  ProductDetailDTO? productDetailDTO;

  factory ProductDetailResponseDTO.fromJson(json) =>
      ProductDetailResponseDTO.fromMap(jsonDecode(json));
  factory ProductDetailResponseDTO.fromMap(Map<String, dynamic> json) =>
      _$ProductDetailResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseDTOToJson(this);
}

ProductDetailResponseDTO _$ProductDetailResponseDTOFromJson(
    Map<String, dynamic> json) {
  if (json["data"] == false) {
    json["data"] = null;
  }
  return ProductDetailResponseDTO(
    status: json['status'] as int?,
    productDetailDTO: json['data'] == null
        ? null
        : ProductDetailDTO.fromMap(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
    userMessage: json['user_msg'] as String?,
  );
}

Map<String, dynamic> _$ProductDetailResponseDTOToJson(
        ProductDetailResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_msg': instance.userMessage,
      'status': instance.status,
      'data': instance.productDetailDTO,
    };
