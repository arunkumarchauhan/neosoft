import 'package:either_dart/either.dart';
import 'package:neostore/core/orders/data/repository/order_repository.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_metadata_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedOrderDetailUseCase {
  OrderRepository _orderRepository;
  GetSelectedOrderDetailUseCase({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;
  Future<Either<Failure, OrderDetailMetaDataEntity>> getProductDetail(
      {required int orderId}) async {
    return await _orderRepository.getOrderDetail(orderId: orderId);
  }
}
