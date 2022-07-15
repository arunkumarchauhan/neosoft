import 'dart:convert';

class OrderItem {
  OrderItem({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  double? cost;
  String? created;

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        cost: (json["cost"] as double?)?.toDouble(),
        created: json["created"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cost": cost,
        "created": created,
      };

  static List<OrderItem> fromMapList(List list) {
    return list
        .map((e) => OrderItem.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
