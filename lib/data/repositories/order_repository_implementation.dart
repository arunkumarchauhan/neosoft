import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:neostore/datasources/remote/implementation/order_api_service.dart';
import 'package:neostore/data/mapper/order_mapper.dart';
import 'package:neostore/domain/repositories/order_repository.dart';
import 'package:neostore/domain/entity/order/order_detail_metadata_entity.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class OrderRepositoryImplementation implements OrderRepository {
  OrderApiService _apiService;
  OrderRepositoryImplementation({required OrderApiService orderApiService})
      : _apiService = orderApiService;

  @override
  Future<Either<Failure, OrderDetailMetaDataEntity>> getOrderDetail(
      {required int orderId}) async {
    try {
      final response = await _apiService.getOrderDetail(orderId);
      if (response.status == 200) {
        return Right(response.mapToEntity());
      } else {
        return Left(Failure("${response.usrMsg} "));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderListItemEntity>>> getOrdersList() async {
    try {
      final response = await _apiService.getOrdersList();

      if (response.status == 200) {
        return Right(response.mapToEntity());
      } else if (response.status! >= 400) {
        return Left(Failure(response.userMsg!));
      } else {
        return Left(Failure("${response.status} : ${response.userMsg}"));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return Left(Failure("Connection Timeout"));
      }
      print(e);
      return Left(Failure("Something Went Wrong"));
    } catch (e) {
      print("Exception Print :  $e");

      return Left(Failure("${e.toString().substring(0, 100)}"));
    }
  }
}
