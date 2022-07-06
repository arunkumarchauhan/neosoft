import 'package:either_dart/either.dart';
import 'package:neostore/core/product/domain/entity/product_detail_entity.dart';
import 'package:neostore/core/product/data/repository/product_repository.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedProductDetail {
  ProductRepository _productRepository;
  GetSelectedProductDetail({required ProductRepository productRepository})
      : _productRepository = productRepository;
  Future<Either<Failure, ProductDetailEntity>> getProductDetail(
      {required int productId}) async {
    return await _productRepository.getProductDetail(productId: productId);
  }
}
