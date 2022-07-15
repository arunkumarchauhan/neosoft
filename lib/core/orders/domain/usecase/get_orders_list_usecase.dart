import 'package:either_dart/either.dart';
import 'package:neostore/core/orders/data/repository/order_repository.dart';
import 'package:neostore/core/orders/domain/entity/order_list_item_entity.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';
import 'package:neostore/core/product/data/repository/product_repository.dart';
import 'package:neostore/utils/models/failure.dart';

class GetOrderstListUseCase {
  OrderRepository _orderRepository;
  GetOrderstListUseCase({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;
  Future<Either<Failure, List<OrderListItemEntity>>> getOrdersList() {
    return _orderRepository.getOrdersList();
  }
}
