import 'dart:convert';

class CartListItemEntity {
  CartListItemEntity({
    this.name,
    this.cost,
    this.productCategory,
    this.productImages,
    this.subTotal,
  });

  String? name;

  @override
  String toString() {
    return 'CartListItemEntity{name: $name, cost: $cost, productCategory: $productCategory, productImages: $productImages, subTotal: $subTotal}';
  }

  double? cost;
  String? productCategory;
  String? productImages;
  double? subTotal;

  factory CartListItemEntity.fromJson(String str) =>
      CartListItemEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemEntity.fromMap(Map<String, dynamic> json) =>
      CartListItemEntity(
        name: json["name"],
        cost: json["cost"],
        productCategory: json["product_category"],
        productImages: json["product_images"],
        subTotal: json["sub_total"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "cost": cost,
        "product_category": productCategory,
        "product_images": productImages,
        "sub_total": subTotal,
      };
}
