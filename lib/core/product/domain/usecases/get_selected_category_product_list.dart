import 'package:either_dart/either.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';
import 'package:neostore/core/product/data/repository/product_repository.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedCategoryProductList {
  ProductRepository _productRepository;
  GetSelectedCategoryProductList({required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, List<ProductListItemEntity>>> getProductsList(
      {required int productCategoryId, int limit = 10, int page = 1}) async {
    return await _productRepository.getProductsList(
        productCategoryId: productCategoryId, limit: limit, page: page);
  }
}
