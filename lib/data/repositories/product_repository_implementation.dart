import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:neostore/datasources/remote/implementation/product_api_service.dart';
import 'package:neostore/data/mapper/product_mapper.dart';
import 'package:neostore/domain/repositories/product_repository.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
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
        return Right(response.productDetailDTO!.mapToEntity());
      } else {
        return Left(Failure("${response.userMessage}"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductListItemEntity>>> getProductsList(
      {required int productCategoryId, int limit = 10, int page = 1}) async {
    try {
      final response = await _apiService.getProductsList(
          productCategoryId: productCategoryId, limit: limit, page: page);

      if (response.status == 200) {
        return Right(response.products!.mapToEntity());
      } else if (response.status! >= 400) {
        return Right([]);
      } else {
        return Left(Failure("${response.status} : ${response.userMessage}"));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return Left(Failure("Connection Timeout"));
      } else if (e.response?.statusCode == 401) {
        return Right([]);
      }
      print(e);
      return Left(Failure("Something Went Wrong"));
    } catch (e) {
      print("Exception $e");

      return Left(Failure("${e.toString().substring(0, 100)}"));
    }
  }
}
