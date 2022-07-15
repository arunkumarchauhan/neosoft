import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/usecases/order/get_order_detail_usecase.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_events.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_states.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  int _orderId = 0;
  int get orderId => _orderId;
  GetSelectedOrderDetailUseCase _useCase;
  OrderDetailBloc(
      {required GetSelectedOrderDetailUseCase getSelectedOrderDetailUseCase})
      : _useCase = getSelectedOrderDetailUseCase,
        super(OrderDetailInitState()) {
    on<FetchOrderDetailEvent>((event, emit) async {
      print(event);
      emit(OrderDetailLoadingState());
      _orderId = event.orderId;
      final response = await _useCase.getProductDetail(orderId: event.orderId);
      response.fold((left) {
        emit(OrderDetailFetchFailedState(failure: left));
      }, (right) {
        print(right);
        emit(OrderDetailFetchSuccessState(order: right));
      });
    });
  }
}
