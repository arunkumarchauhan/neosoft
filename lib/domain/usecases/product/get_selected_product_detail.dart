import 'package:either_dart/either.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/domain/mapper/product_mapper.dart';
import 'package:neostore/domain/repositories/product_repository.dart';
import 'package:neostore/presentation/product_detail/model/product.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedProductDetailUseCase {
  ProductRepository _productRepository;
  GetSelectedProductDetailUseCase(
      {required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, Product>> getProductDetail(
      {required int productId}) async {
    final response =
        await _productRepository.getProductDetail(productId: productId);
    if (response.isLeft) {
      return Left(response.left);
    }
    return Right(response.right.mapToPresentation());
  }
}
