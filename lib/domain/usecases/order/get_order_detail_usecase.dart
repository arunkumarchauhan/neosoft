import 'package:either_dart/either.dart';
import 'package:neostore/domain/mapper/order_mapper.dart';
import 'package:neostore/domain/repositories/order_repository.dart';
import 'package:neostore/domain/entity/order/order_detail_metadata_entity.dart';
import 'package:neostore/presentation/my_order/model/order_detail_meta.dart';
import 'package:neostore/utils/models/failure.dart';

class GetSelectedOrderDetailUseCase {
  OrderRepository _orderRepository;
  GetSelectedOrderDetailUseCase({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;
  Future<Either<Failure, OrderDetailMeta>> getProductDetail(
      {required int orderId}) async {
    final response = await _orderRepository.getOrderDetail(orderId: orderId);
    if (response.isLeft) {
      return Left(response.left);
    }
    return Right(response.right.mapToPresentation());
  }
}
