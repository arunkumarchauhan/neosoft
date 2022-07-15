import 'dart:convert';

import 'package:neostore/presentation/cart/model/cart_item.dart';

class CartItemMeta {
  CartItemMeta({
    this.quantity,
    this.product,
  });

  @override
  String toString() {
    return 'CartItemMeta{quantity: $quantity, product: $product}';
  }

  int? quantity;
  CartItem? product;

  factory CartItemMeta.fromJson(String str) =>
      CartItemMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemMeta.fromMap(Map<String, dynamic> json) => CartItemMeta(
        quantity: json["quantity"],
        product:
            json["product"] == null ? null : CartItem.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "product": product?.toMap(),
      };
}
