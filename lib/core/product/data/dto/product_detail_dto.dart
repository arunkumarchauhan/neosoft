import 'package:json_annotation/json_annotation.dart';
import 'package:neostore/core/product/data/dto/product_image.dart';

part 'product_detail_dto.g.dart';

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

  factory ProductDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailDTOToJson(this);
}
