import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/datasources/dto/product_detail/product_detail_dto.dart';
import 'package:neostore/datasources/dto/product_list/product_dto.dart';

// class ProductMapper {
//   static List<ProductListItemEntity>
//       mapProductListResponseDtoToProductListItemEntityList(
//               List<ProductDTO> list) =>
//           productItemEntityListFromJson(list);
//
//   static ProductDetailEntity mapProductDetailDtoToProductDetailEntity(
//           ProductDetailDTO dto) =>
//       ProductDetailEntity.fromJson(dto.toJson());
// }

extension ProductListMapper on List<ProductDTO> {
  List<ProductListItemEntity> mapToEntity() {
    return productItemEntityListFromJson(this);
  }
}

extension ProductDetailMapper on ProductDetailDTO {
  ProductDetailEntity mapToEntity() {
    return ProductDetailEntity.fromJson(toJson());
  }
}
