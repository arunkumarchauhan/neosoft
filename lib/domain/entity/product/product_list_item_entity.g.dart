// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListItemEntity _$ProductListItemEntityFromJson(
        Map<String, dynamic> json) =>
    ProductListItemEntity(
      id: json['id'] as int,
      productCategoryId: json['product_category_id'] as int,
      name: json['name'] as String,
      producer: json['producer'] as String,
      cost: (json['cost'] as num).toDouble(),
      rating: json['rating'] as int,
      productImages: json['product_images'] as String,
    );

Map<String, dynamic> _$ProductListItemEntityToJson(
        ProductListItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_category_id': instance.productCategoryId,
      'name': instance.name,
      'producer': instance.producer,
      'cost': instance.cost,
      'rating': instance.rating,
      'product_images': instance.productImages,
    };
