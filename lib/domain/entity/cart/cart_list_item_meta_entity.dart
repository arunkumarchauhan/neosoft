import 'dart:convert';

import 'package:neostore/presentation/cart/model/cart_item.dart';

class CartListItemMetaEntity {
  CartListItemMetaEntity({
    this.quantity,
    this.product,
  });

  @override
  String toString() {
    return 'CartListItemMetaEntity{quantity: $quantity, product: $product}';
  }

  int? quantity;
  CartItem? product;

  factory CartListItemMetaEntity.fromJson(String str) =>
      CartListItemMetaEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemMetaEntity.fromMap(Map<String, dynamic> json) =>
      CartListItemMetaEntity(
        quantity: json["quantity"],
        product:
            json["product"] == null ? null : CartItem.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "product": product?.toMap(),
      };
}
