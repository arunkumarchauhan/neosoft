import 'package:either_dart/either.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_metadata_entity.dart';
import 'package:neostore/core/orders/domain/entity/order_list_item_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderListItemEntity>>> getOrdersList();
  Future<Either<Failure, OrderDetailMetaDataEntity>> getOrderDetail(
      {required int orderId});
}
