import 'package:neostore/core/orders/data/dto/order_detail_dto.dart';
import 'dart:convert';

class OrderDetailMetaDataDto {
  OrderDetailMetaDataDto({
    this.id,
    this.cost,
    this.address,
    this.orderDetails,
  });

  int? id;
  double? cost;
  String? address;
  List<OrderDetailDto>? orderDetails;

  factory OrderDetailMetaDataDto.fromJson(String str) =>
      OrderDetailMetaDataDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailMetaDataDto.fromMap(Map<String, dynamic> json) =>
      OrderDetailMetaDataDto(
        id: json["id"],
        cost: double.tryParse((json["cost"] ?? "0").toString()),
        address: json["address"],
        orderDetails: json["order_details"] == null
            ? null
            : List<OrderDetailDto>.from(
                json["order_details"].map((x) => OrderDetailDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "address": address,
        "order_details": orderDetails == null
            ? null
            : List<dynamic>.from(orderDetails!.map((x) => x.toMap())),
      };
}
