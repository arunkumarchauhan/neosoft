import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:neostore/core/cart/data/datasource/cart_api_service.dart';
import 'package:neostore/core/cart/data/mapper/cart_mapper.dart';
import 'package:neostore/core/cart/domain/entity/cart_item_list_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

import '../../data/repository/cart_repository.dart';

class CartRepositoryImplementation extends CartRepository {
  CartApiService _apiService;
  CartRepositoryImplementation({required CartApiService cartApiService})
      : _apiService = cartApiService;

  @override
  Future<Either<Failure, CartListItemResponseEntity>> getCartItemsList() async {
    try {
      final response = await _apiService.getCartItemsList();
      if (response.status == 200) {
        return Right(
            CartMapper.mapCartListResponseDtoToCartListItemResponseEntity(
                response));
      } else {
        return Left(Failure("${response.userMsg} "));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return Left(Failure("Connection Timeout"));
      } else if (e.type == DioErrorType.other) {
        print(e);
        return Left(Failure("Something Went Wrong"));
      }
    } catch (e) {
      print("Exception Print :  $e");

      return Left(Failure("${e.toString().substring(0, 100)}"));
    }
    return Left(Failure("Something Went Wrong"));
  }
}
