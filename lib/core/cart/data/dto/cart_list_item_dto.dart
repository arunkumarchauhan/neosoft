import 'dart:convert';

class CartListItemDto {
  CartListItemDto({
    this.id,
    this.name,
    this.cost,
    this.productCategory,
    this.productImages,
    this.subTotal,
  });

  int? id;
  String? name;
  double? cost;
  String? productCategory;
  String? productImages;
  double? subTotal;

  factory CartListItemDto.fromJson(String str) =>
      CartListItemDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemDto.fromMap(Map<String, dynamic> json) => CartListItemDto(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        productCategory: json["product_category"],
        productImages: json["product_images"],
        subTotal: json["sub_total"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "cost": cost,
        "product_category": productCategory,
        "product_images": productImages,
        "sub_total": subTotal,
      };
}
