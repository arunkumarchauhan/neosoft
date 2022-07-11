import 'package:get_it/get_it.dart';
import 'package:neostore/core/orders/data/datasource/order_api_service.dart';
import 'package:neostore/core/orders/domain/repository/order_repository_implementation.dart';
import 'package:neostore/core/orders/domain/usecase/get_order_detail_usecase.dart';
import 'package:neostore/core/orders/domain/usecase/get_orders_list_usecase.dart';
import 'package:neostore/feature/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/feature/my_order/controller/order_list/order_list_bloc.dart';
import 'package:neostore/services/api_service.dart';

void inject() {
  final locator = GetIt.instance;

  locator.registerLazySingleton(() => GetSelectedOrderDetailUseCase(
      orderRepository: locator<OrderRepositoryImplementation>()));

  locator.registerLazySingleton(() => OrderDetailBloc(
      getSelectedOrderDetailUseCase: locator<GetSelectedOrderDetailUseCase>()));
}
