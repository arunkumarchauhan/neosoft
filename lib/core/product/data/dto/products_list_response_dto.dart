import 'dart:convert';

import 'package:neostore/core/product/data/dto/product_dto.dart';

class ProductsListResponseDTO {
  ProductsListResponseDTO({
    this.status,
    this.products,
  });
  String? message;
  String? userMessage;
  int? status;
  List<ProductDTO>? products;
  factory ProductsListResponseDTO.fromJson(json) {
    return ProductsListResponseDTO.fromMap(jsonDecode(json));
  }

  factory ProductsListResponseDTO.fromMap(Map<String, dynamic> json) =>
      _$ProductsListResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsListResponseDTOToJson(this);
}

ProductsListResponseDTO _$ProductsListResponseDTOFromJson(
    Map<String, dynamic> json) {
  if (json['data'] == false) {
    json['data'] = [];
  }
  return ProductsListResponseDTO(
    status: json['status'] as int?,
    products: (json['data'] as List<dynamic>?)
        ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..message = json['message'] as String?
    ..userMessage = json['usr_msg'] as String?;
}

Map<String, dynamic> _$ProductsListResponseDTOToJson(
        ProductsListResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'usr_msg': instance.userMessage,
      'status': instance.status,
      'data': instance.products,
    };
