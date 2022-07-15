import 'dart:convert';

class CartItem {
  CartItem({
    this.name,
    this.cost,
    this.productCategory,
    this.productImages,
    this.subTotal,
  });

  String? name;

  @override
  String toString() {
    return 'CartItem {name: $name, cost: $cost, productCategory: $productCategory, productImages: $productImages, subTotal: $subTotal}';
  }

  double? cost;
  String? productCategory;
  String? productImages;
  double? subTotal;

  factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
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
