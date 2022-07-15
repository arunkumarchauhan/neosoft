class ProductImage {
  ProductImage({
    this.id,
    this.productId,
    this.image,
    this.created,
    this.modified,
  });

  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json["id"],
      productId: json["product_id"],
      image: json["image"],
      created: json["created"],
      modified: json["modified"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "created": created,
        "modified": modified,
      };
}
