class ProductDetailEntity {
  ProductDetailEntity({
    required this.id,
    required this.productCategoryId,
    required this.name,
    required this.producer,
    required this.description,
    required this.cost,
    required this.rating,
    required this.productImages,
  });

  int id;
  int productCategoryId;
  String name;
  String producer;
  String description;
  int cost;
  int rating;
  List<ProductImageEntity> productImages;

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) {
    return ProductDetailEntity(
      id: json["id"],
      productCategoryId: json["product_category_id"],
      name: json["name"],
      producer: json["producer"],
      description: json["description"],
      cost: json["cost"],
      rating: json["rating"],
      productImages: List<ProductImageEntity>.from(
          json["product_images"]?.map((x) => ProductImageEntity.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_category_id": productCategoryId,
        "name": name,
        "producer": producer,
        "description": description,
        "cost": cost,
        "rating": rating,
        "product_images":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
      };
}

class ProductImageEntity {
  ProductImageEntity({
    required this.id,
    required this.productId,
    required this.image,
  });

  int id;
  int productId;
  String image;

  factory ProductImageEntity.fromJson(Map<String, dynamic> json) =>
      ProductImageEntity(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
      };
}
