import 'dart:convert';

import 'package:neostore/core/cart/data/dto/cart_list_item_meta_dto.dart';
import 'package:neostore/core/cart/domain/entity/cart_list_item_meta_entity.dart';

class CartListItemResponseEntity {
  CartListItemResponseEntity({
    this.productMetaEntity,
    this.count,
    this.total,
  });

  List<CartListItemMetaEntity>? productMetaEntity;
  int? count;

  @override
  String toString() {
    return 'CartListItemResponseEntity{productMetaEntity: $productMetaEntity, count: $count, total: $total}';
  }

  double? total;

  factory CartListItemResponseEntity.fromJson(String str) =>
      CartListItemResponseEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListItemResponseEntity.fromMap(Map<String, dynamic> json) =>
      CartListItemResponseEntity(
          productMetaEntity: json["data"] == null
              ? null
              : List<CartListItemMetaEntity>.from(
                  json["data"].map((x) => CartListItemMetaEntity.fromMap(x))),
          count: json["count"],
          total: json["total"]);

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(productMetaEntity!.map((x) => x.toMap())),
        "count": count,
        "total": total,
      };
}
