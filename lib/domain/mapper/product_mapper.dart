import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/presentation/product_detail/model/product.dart';
import 'package:neostore/presentation/product_listing/model/product_item.dart';

extension ProductListMapper on List<ProductListItemEntity> {
  List<ProductItem> mapToPresentation() {
    return map((e) => ProductItem.fromJson(e.toJson())).toList();
  }
}

extension ProductDetailMapper on ProductDetailEntity {
  Product mapToPresentation() {
    return Product.fromJson(toJson());
  }
}
