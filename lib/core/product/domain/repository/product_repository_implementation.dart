import 'package:either_dart/src/either.dart';
import 'package:neostore/core/product/data/datasource/product_api_service.dart';
import 'package:neostore/core/product/data/mapper/product_mapper.dart';
import 'package:neostore/core/product/data/repository/product_repository.dart';
import 'package:neostore/core/product/domain/entity/product_detail_entity.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class ProductRepositoryImplementation extends ProductRepository {
  ProductApiService _apiService;
  ProductRepositoryImplementation(
      {required ProductApiService productApiService})
      : _apiService = productApiService;

  @override
  Future<Either<Failure, ProductDetailEntity>> getProductDetail(
      {required int productId}) async {
    try {
      final response = await _apiService.getProductDetail(productId);
      if (response.status == 200) {
        return Right(ProductMapper.mapProductDetailDtoToProductDetailEntity(
            response.productDetailDTO!));
      } else {
        return Left(Failure("${response.userMessage}"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductListItemEntity>>> getProductsList(
      {required int productCategoryId, int limit = 10, int page = 2}) async {
    try {
      final response = await _apiService.getProductsList(productCategoryId,
          limit: limit, page: page);
      if (response.status == 200) {
        return Right(
            ProductMapper.mapProductListResponseDtoToProductListItemEntityList(
                response.products!));
      } else {
        return Left(Failure("${response.status}"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
