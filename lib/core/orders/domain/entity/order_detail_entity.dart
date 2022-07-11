import 'dart:convert';

class OrderDetailEntity {
  OrderDetailEntity({
    this.quantity,
    this.total,
    this.prodName,
    this.prodCatName,
    this.prodImage,
  });

  int? quantity;
  double? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  factory OrderDetailEntity.fromJson(String str) =>
      OrderDetailEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailEntity.fromMap(Map<String, dynamic> json) =>
      OrderDetailEntity(
        quantity: json["quantity"],
        total: (json["total"] as double?)?.toDouble(),
        prodName: json["prod_name"],
        prodCatName: json["prod_cat_name"],
        prodImage: json["prod_image"],
      );

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "total": total,
        "prod_name": prodName,
        "prod_cat_name": prodCatName,
        "prod_image": prodImage,
      };
}
