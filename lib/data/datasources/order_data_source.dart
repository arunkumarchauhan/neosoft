import 'package:neostore/datasources/dto/order_detail/order_detail_response_dto.dart';
import 'package:neostore/datasources/dto/order_list/order_list_response_dto.dart';

abstract class OrderDataSource {
  Future<OrderListResponseDto> getOrdersList();
  Future<OrderDetailResponseDto> getOrderDetail(int orderId);
}
