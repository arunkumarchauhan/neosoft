import 'package:equatable/equatable.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';
import 'package:neostore/presentation/my_order/model/order_item.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class OrderListingState extends Equatable {}

class OrdersListInitState extends OrderListingState {
  @override
  List<Object?> get props => [];
}

class OrdersListLoadingState extends OrderListingState {
  @override
  List<Object?> get props => [];
}

class OrderListFetchFailedState extends OrderListingState {
  final Failure failure;
  OrderListFetchFailedState({required this.failure});
  @override
  List<Object?> get props => [failure];
  @override
  String toString() {
    return "Failure : ${failure.message}";
  }
}

class OrderListFetchSuccessState extends OrderListingState {
  final List<OrderItem> orders;
  OrderListFetchSuccessState({required this.orders});
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "OrderListFetchSuccessState : ${orders.length}";
  }
}
