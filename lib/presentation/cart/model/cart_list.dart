import 'dart:convert';

import 'package:neostore/presentation/cart/model/cart_item_meta.dart';

class CartList {
  CartList({
    this.productMetaEntity,
    this.count,
    this.total,
  });

  List<CartItemMeta>? productMetaEntity;
  int? count;

  @override
  String toString() {
    return 'CartList{productMetaEntity: $productMetaEntity, count: $count, total: $total}';
  }

  double? total;

  factory CartList.fromJson(String str) => CartList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartList.fromMap(Map<String, dynamic> json) => CartList(
      productMetaEntity: json["data"] == null
          ? null
          : List<CartItemMeta>.from(
              json["data"].map((x) => CartItemMeta.fromMap(x))),
      count: json["count"],
      total: json["total"]);

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(productMetaEntity!.map((x) => x.toMap())),
        "count": count,
        "total": total,
      };
}
