import 'dart:convert';

import 'package:neostore/core/cart/data/dto/cart_list_item_meta_dto.dart';

class CartListResponseDto {
  CartListResponseDto({
    this.status,
    this.productMetaDto,
    this.count,
    this.total,
    this.message,
    this.userMsg,
  });

  int? status;
  List<CartListItemMetaDto>? productMetaDto;
  int? count;
  double? total;
  String? message;
  String? userMsg;

  factory CartListResponseDto.fromJson(String str) =>
      CartListResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartListResponseDto.fromMap(Map<String, dynamic> json) =>
      CartListResponseDto(
        status: json["status"],
        productMetaDto: json["data"] == null
            ? null
            : List<CartListItemMetaDto>.from(
                json["data"].map((x) => CartListItemMetaDto.fromMap(x))),
        count: json["count"],
        total: json["total"],
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": productMetaDto == null
            ? null
            : List<dynamic>.from(productMetaDto!.map((x) => x.toMap())),
        "count": count,
        "total": total,
        "message": message,
        "user_msg": userMsg,
      };
}
