import 'package:neostore/datasources/dto/product_detail/product_image.dart';

class Product {
  Product({
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
  List<ProductImage> productImages;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      productCategoryId: json["product_category_id"],
      name: json["name"],
      producer: json["producer"],
      description: json["description"],
      cost: json["cost"],
      rating: json["rating"],
      productImages: List<ProductImage>.from(
          json["product_images"]?.map((x) => ProductImage.fromJson(x))),
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
