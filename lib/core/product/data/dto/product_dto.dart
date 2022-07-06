import 'package:json_annotation/json_annotation.dart';
part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  ProductDTO({
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
  double? cost;
  int? rating;
  @JsonKey(name: "view_count")
  int? viewCount;
  String? created;
  String? modified;

  @JsonKey(name: "product_images")
  String? productImages;

  List<ProductDTO>? products;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}
