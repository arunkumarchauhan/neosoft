import 'dart:convert';

import 'package:neostore/core/cart/data/dto/cart_list_item_dto.dart';

class CartListItemMetaDto {
  CartListItemMetaDto({
    this.id,
    this.productId,
    this.quantity,
    this.product,
  });

  int? id;
  int? productId;
  int? quantity;
  CartListItemDto? product;

  factory CartListItemMetaDto.fromJson(String str) =>
      CartListItemMetaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemMetaDto.fromMap(Map<String, dynamic> json) =>
      CartListItemMetaDto(
        id: json["id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        product: json["product"] == null
            ? null
            : CartListItemDto.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId,
        "quantity": quantity,
        "product": product?.toMap(),
      };
}
