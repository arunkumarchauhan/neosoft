import 'dart:convert';

class OrderDetailDto {
  OrderDetailDto({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.total,
    this.prodName,
    this.prodCatName,
    this.prodImage,
  });

  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  double? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  factory OrderDetailDto.fromJson(String str) =>
      OrderDetailDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailDto.fromMap(Map<String, dynamic> json) => OrderDetailDto(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        total: double.tryParse((json["total"] ?? "0").toString()),
        prodName: json["prod_name"],
        prodCatName: json["prod_cat_name"],
        prodImage: json["prod_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "total": total,
        "prod_name": prodName,
        "prod_cat_name": prodCatName,
        "prod_image": prodImage,
      };
}
