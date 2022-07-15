class ProductItem {
  ProductItem({
    required this.id,
    required this.productCategoryId,
    required this.name,
    required this.producer,
    required this.cost,
    required this.rating,
    required this.productImages,
  });

  int id;
  int productCategoryId;
  String name;
  String producer;
  double cost;
  int rating;
  String productImages;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int,
      productCategoryId: json['product_category_id'] as int,
      name: json['name'] as String,
      producer: json['producer'] as String,
      cost: (json['cost'] as num).toDouble(),
      rating: json['rating'] as int,
      productImages: json['product_images'] as String,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_category_id': instance.productCategoryId,
      'name': instance.name,
      'producer': instance.producer,
      'cost': instance.cost,
      'rating': instance.rating,
      'product_images': instance.productImages,
    };
