import 'package:neostore/core/product/data/dto/product_detail_dto.dart';
import 'package:neostore/core/product/data/dto/product_dto.dart';
import 'package:neostore/core/product/domain/entity/product_detail_entity.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';

class ProductMapper {
  static List<ProductListItemEntity>
      mapProductListResponseDtoToProductListItemEntityList(
              List<ProductDTO> list) =>
          productItemEntityListFromJson(list);

  static ProductDetailEntity mapProductDetailDtoToProductDetailEntity(
          ProductDetailDTO dto) =>
      ProductDetailEntity.fromJson(dto.toJson());
}
