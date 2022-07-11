import 'dart:convert';

class ProductListResponseDto {
  ProductListResponseDto({
    this.status,
    this.data,
    this.message,
    this.userMsg,
  });

  int? status;
  List<OrderDTO>? data;
  String? message;
  String? userMsg;

  factory ProductListResponseDto.fromJson(String str) =>
      ProductListResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductListResponseDto.fromMap(Map<String, dynamic> json) =>
      ProductListResponseDto(
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<OrderDTO>.from(json["data"].map((x) => OrderDTO.fromMap(x))),
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "user_msg": userMsg,
      };
}

class OrderDTO {
  OrderDTO({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  int? cost;
  String? created;

  factory OrderDTO.fromJson(String str) => OrderDTO.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDTO.fromMap(Map<String, dynamic> json) => OrderDTO(
        id: json["id"],
        cost: json["cost"],
        created: json["created"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "created": created,
      };
}
