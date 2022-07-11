import 'dart:convert';

class OrderEntity {
  OrderEntity({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  int? cost;
  String? created;

  factory OrderEntity.fromJson(String str) =>
      OrderEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderEntity.fromMap(Map<String, dynamic> json) => OrderEntity(
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
