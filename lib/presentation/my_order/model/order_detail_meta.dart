import 'package:neostore/datasources/dto/order_detail/order_detail_dto.dart';
import 'dart:convert';

import 'package:neostore/domain/entity/order/order_detail_entity.dart';
import 'package:neostore/presentation/my_order/model/order_detail.dart';

class OrderDetailMeta {
  OrderDetailMeta({
    this.id,
    this.cost,
    this.address,
    this.orderDetails,
  });

  int? id;
  double? cost;
  String? address;
  List<OrderDetail>? orderDetails;

  factory OrderDetailMeta.fromJson(String str) =>
      OrderDetailMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailMeta.fromMap(Map<String, dynamic> json) {
    return OrderDetailMeta(
      id: json["id"],
      cost: json["cost"] as double?,
      address: json["address"],
      orderDetails: json["order_details"] == null
          ? null
          : List<OrderDetail>.from(
              json["order_details"].map((x) => OrderDetail.fromMap(x))),
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
