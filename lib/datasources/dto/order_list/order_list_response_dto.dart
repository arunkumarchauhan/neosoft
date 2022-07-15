import 'dart:convert';

import 'package:neostore/datasources/dto/order_list/order_dto.dart';

class OrderListResponseDto {
  OrderListResponseDto({
    this.status,
    this.orderDtoList,
    this.message,
    this.userMsg,
  });

  int? status;
  List<OrderDTO>? orderDtoList;
  String? message;
  String? userMsg;

  factory OrderListResponseDto.fromJson(String str) =>
      OrderListResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderListResponseDto.fromMap(Map<String, dynamic> json) =>
      OrderListResponseDto(
        status: json["status"],
        orderDtoList: json["data"] == null
            ? null
            : List<OrderDTO>.from(json["data"].map((x) => OrderDTO.fromMap(x))),
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": orderDtoList == null
            ? null
            : List<dynamic>.from(orderDtoList!.map((x) => x.toMap())),
        "message": message,
        "user_msg": userMsg,
      };
}
