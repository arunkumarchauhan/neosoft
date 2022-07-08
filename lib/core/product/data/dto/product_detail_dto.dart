import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:neostore/core/product/data/dto/product_image.dart';

@JsonSerializable()
class ProductDetailDTO {
  ProductDetailDTO({
    this.id,
    this.productCategoryId,
    this.name,
    this.producer,
    this.description,
    this.cost,
    this.rating,
    this.viewCount,
    this.created,
    this.modified,
    this.productImages,
  });

  int? id;
  @JsonKey(name: "product_category_id")
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  int? rating;
  @JsonKey(name: "view_count")
  int? viewCount;
  String? created;
  String? modified;

  @JsonKey(name: "product_images")
  List<ProductImage>? productImages;

  factory ProductDetailDTO.fromMap(Map<String, dynamic> json) {
    return _$ProductDetailDTOFromJson(json);
  }
  factory ProductDetailDTO.fromJson(json) =>
      ProductDetailDTO.fromMap(jsonDecode(json));

  Map<String, dynamic> toJson() => _$ProductDetailDTOToJson(this);
}

ProductDetailDTO _$ProductDetailDTOFromJson(Map<String, dynamic> json) =>
    ProductDetailDTO(
      id: json['id'] as int?,
      productCategoryId: json['product_category_id'] as int?,
      name: json['name'] as String?,
      producer: json['producer'] as String?,
      description: json['description'] as String?,
      cost: json['cost'] as int?,
      rating: json['rating'] as int?,
      viewCount: json['view_count'] as int?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      productImages: (json['product_images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailDTOToJson(ProductDetailDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_category_id': instance.productCategoryId,
      'name': instance.name,
      'producer': instance.producer,
      'description': instance.description,
      'cost': instance.cost,
      'rating': instance.rating,
      'view_count': instance.viewCount,
      'created': instance.created,
      'modified': instance.modified,
      'product_images': instance.productImages?.map((e) => e.toJson()).toList(),
    };
