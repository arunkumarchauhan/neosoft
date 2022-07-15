import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/usecases/order/get_orders_list_usecase.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_event.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_state.dart';

class OrderListingBloc extends Bloc<OrderListingEvent, OrderListingState> {
  GetOrderstListUseCase _useCase;

  OrderListingBloc({required GetOrderstListUseCase getOrderstListUseCase})
      : _useCase = getOrderstListUseCase,
        super(OrdersListInitState()) {
    on<FetchOrderListEvent>((event, emit) async {
      emit(OrdersListLoadingState());

      final response = await _useCase.getOrdersList();
      response.fold((left) {
        emit(OrderListFetchFailedState(failure: left));
      }, (right) {
        emit(OrderListFetchSuccessState(orders: right));
      });
    });
  }
}
