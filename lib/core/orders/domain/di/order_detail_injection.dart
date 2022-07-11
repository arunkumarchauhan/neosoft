import 'package:get_it/get_it.dart';
import 'package:neostore/core/orders/domain/repository/order_repository_implementation.dart';
import 'package:neostore/core/orders/domain/usecase/get_order_detail_usecase.dart';
import 'package:neostore/feature/my_order/controller/order_detail/order_detail_bloc.dart';

void inject() {
  final locator = GetIt.instance;

  locator.registerLazySingleton(() => GetSelectedOrderDetailUseCase(
      orderRepository: locator<OrderRepositoryImplementation>()));

  locator.registerLazySingleton(() => OrderDetailBloc(
      getSelectedOrderDetailUseCase: locator<GetSelectedOrderDetailUseCase>()));
}
