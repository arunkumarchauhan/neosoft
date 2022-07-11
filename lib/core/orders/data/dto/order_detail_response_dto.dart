import 'dart:convert';

import 'package:neostore/core/orders/data/dto/order_detail_metadata_dto.dart';

class OrderDetailResponseDto {
  OrderDetailResponseDto(
      {this.status, this.orderDetailResponseDto, this.usrMsg, this.message});

  int? status;
  OrderDetailMetaDataDto? orderDetailResponseDto;
  String? usrMsg;
  String? message;

  factory OrderDetailResponseDto.fromJson(String str) =>
      OrderDetailResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailResponseDto.fromMap(Map<String, dynamic> json) =>
      OrderDetailResponseDto(
        status: json["status"],
        orderDetailResponseDto: json["data"] == null
            ? null
            : OrderDetailMetaDataDto.fromMap(json["data"]),
        usrMsg: json["user_msg"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": orderDetailResponseDto?.toMap(),
        "user_msg": usrMsg,
        "message": message
      };
}
