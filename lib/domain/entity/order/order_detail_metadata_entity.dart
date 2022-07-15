import 'package:neostore/datasources/dto/order_detail/order_detail_dto.dart';
import 'dart:convert';

import 'package:neostore/domain/entity/order/order_detail_entity.dart';

class OrderDetailMetaDataEntity {
  OrderDetailMetaDataEntity({
    this.id,
    this.cost,
    this.address,
    this.orderDetails,
  });

  int? id;
  double? cost;
  String? address;
  List<OrderDetailEntity>? orderDetails;

  factory OrderDetailMetaDataEntity.fromJson(String str) =>
      OrderDetailMetaDataEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailMetaDataEntity.fromMap(Map<String, dynamic> json) {
    return OrderDetailMetaDataEntity(
      id: json["id"],
      cost: json["cost"] as double?,
      address: json["address"],
      orderDetails: json["order_details"] == null
          ? null
          : List<OrderDetailEntity>.from(
              json["order_details"].map((x) => OrderDetailEntity.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "address": address,
        "order_details": orderDetails == null
            ? null
            : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
      };
}
