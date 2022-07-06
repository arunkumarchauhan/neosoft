// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      'product_images': instance.productImages,
    };
