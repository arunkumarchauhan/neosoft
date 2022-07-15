import 'package:neostore/datasources/dto/product_detail/product_detail_response_dto.dart';
import 'package:neostore/datasources/dto/product_list/products_list_response_dto.dart';

abstract class ProductDataSource {
  Future<ProductsListResponseDTO> getProductsList(
      {int productCategoryId = 1, int limit = 10, int page = 1});
  Future<ProductDetailResponseDTO> getProductDetail(int productId);
}
