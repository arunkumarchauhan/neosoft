import 'package:get_it/get_it.dart';
import 'package:neostore/core/cart/data/datasource/cart_api_service.dart';
import 'package:neostore/core/cart/domain/repository/cart_repository_implementation.dart';
import 'package:neostore/core/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:neostore/feature/cart/controller/cart_list_bloc.dart';
import 'package:neostore/services/api_service.dart';

void inject() {
  final locator = GetIt.instance;
  locator.registerLazySingleton(
      () => CartApiService(apiService: locator<ApiService>()));
  locator.registerLazySingleton(() =>
      CartRepositoryImplementation(cartApiService: locator<CartApiService>()));
  locator.registerLazySingleton(() => GetCartItemsUseCase(
      cartRepository: locator<CartRepositoryImplementation>()));

  locator.registerLazySingleton(
      () => CartListBloc(cartItemsUseCase: locator<GetCartItemsUseCase>()));
}
