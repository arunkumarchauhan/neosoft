import 'dart:convert';

class OrderDetail {
  OrderDetail({
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

  factory OrderDetail.fromJson(String str) =>
      OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
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
