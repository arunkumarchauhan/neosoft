import 'package:either_dart/either.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/domain/mapper/product_mapper.dart';
import 'package:neostore/domain/repositories/product_repository.dart';
import 'package:neostore/presentation/product_listing/model/product_item.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedCategoryProductListUseCase {
  ProductRepository _productRepository;
  GetSelectedCategoryProductListUseCase(
      {required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, List<ProductItem>>> getProductsList(
      {required int productCategoryId, int limit = 10, int page = 1}) async {
    final response = await _productRepository.getProductsList(
        productCategoryId: productCategoryId, limit: limit, page: page);
    if (response.isLeft) {
      return Left(response.left);
    }
    return Right(response.right.mapToPresentation());
  }
}
