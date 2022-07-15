import 'package:either_dart/either.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductListItemEntity>>> getProductsList(
      {required int productCategoryId, int limit = 10, int page = 1});
  Future<Either<Failure, ProductDetailEntity>> getProductDetail(
      {required int productId});
}
