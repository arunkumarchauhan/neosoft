import 'package:either_dart/either.dart';
import 'package:neostore/core/product/domain/entity/product_detail_entity.dart';
import 'package:neostore/core/product/data/repository/product_repository.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedProductDetailUseCase {
  ProductRepository _productRepository;
  GetSelectedProductDetailUseCase(
      {required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, ProductDetailEntity>> getProductDetail(
      {required int productId}) {
    return _productRepository.getProductDetail(productId: productId);
  }
}
