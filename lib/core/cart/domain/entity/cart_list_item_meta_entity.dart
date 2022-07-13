import 'dart:convert';

import 'package:neostore/core/cart/data/dto/cart_list_item_dto.dart';
import 'package:neostore/core/cart/domain/entity/cart_list_item_entity.dart';

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
  CartListItemEntity? product;

  factory CartListItemMetaEntity.fromJson(String str) =>
      CartListItemMetaEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemMetaEntity.fromMap(Map<String, dynamic> json) =>
      CartListItemMetaEntity(
        quantity: json["quantity"],
        product: json["product"] == null
            ? null
            : CartListItemEntity.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "product": product?.toMap(),
      };
}
