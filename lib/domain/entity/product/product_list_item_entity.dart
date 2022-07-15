import 'package:json_annotation/json_annotation.dart';
import 'package:neostore/datasources/dto/product_list/product_dto.dart';
part 'product_list_item_entity.g.dart';

List<ProductListItemEntity> productItemEntityListFromJson(
        List<ProductDTO> list) =>
    List<ProductListItemEntity>.from(
        list.map((x) => ProductListItemEntity.fromJson(x.toJson())));

@JsonSerializable()
class ProductListItemEntity {
  ProductListItemEntity({
    required this.id,
    required this.productCategoryId,
    required this.name,
    required this.producer,
    required this.cost,
    required this.rating,
    required this.productImages,
  });

  int id;
  @JsonKey(name: "product_category_id")
  int productCategoryId;
  String name;
  String producer;
  double cost;
  int rating;
  @JsonKey(name: "product_images")
  String productImages;

  factory ProductListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductListItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListItemEntityToJson(this);
}
