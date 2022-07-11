import 'dart:convert';

class OrderListItemEntity {
  OrderListItemEntity({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  double? cost;
  String? created;

  factory OrderListItemEntity.fromJson(String str) =>
      OrderListItemEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderListItemEntity.fromMap(Map<String, dynamic> json) =>
      OrderListItemEntity(
        id: json["id"],
        cost: (json["cost"] as double?)?.toDouble(),
        created: json["created"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "created": created,
      };

  static List<OrderListItemEntity> fromMapList(List list) {
    return list
        .map((e) => OrderListItemEntity.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
