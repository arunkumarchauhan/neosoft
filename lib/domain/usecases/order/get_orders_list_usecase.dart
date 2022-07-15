import 'package:either_dart/either.dart';
import 'package:neostore/domain/mapper/order_mapper.dart';
import 'package:neostore/domain/repositories/order_repository.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';
import 'package:neostore/domain/entity/product/product_list_item_entity.dart';
import 'package:neostore/domain/repositories/product_repository.dart';
import 'package:neostore/presentation/my_order/model/order_item.dart';
import 'package:neostore/utils/models/failure.dart';

class GetOrderstListUseCase {
  OrderRepository _orderRepository;
  GetOrderstListUseCase({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;
  Future<Either<Failure, List<OrderItem>>> getOrdersList() async {
    final response = await _orderRepository.getOrdersList();
    if (response.isLeft) {
      return Left(response.left);
    }
    return Right(response.right.mapToPresentation());
  }
}
