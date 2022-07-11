import 'dart:convert';

class OrderDTO {
  OrderDTO({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  double? cost;
  String? created;

  factory OrderDTO.fromJson(String str) => OrderDTO.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDTO.fromMap(Map<String, dynamic> json) => OrderDTO(
        id: json["id"],
        cost: double.tryParse((json["cost"] ?? "0").toString()),
        created: json["created"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "created": created,
      };
}
