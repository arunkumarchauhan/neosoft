import 'package:get_it/get_it.dart';
import 'package:neostore/core/product/domain/repository/product_repository_implementation.dart';
import 'package:neostore/core/product/domain/usecases/get_selected_product_detail.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_bloc.dart';

void inject() {
  final locator = GetIt.instance;

  locator.registerLazySingleton(() => GetSelectedProductDetailUseCase(
      productRepository: locator<ProductRepositoryImplementation>()));
  locator.registerLazySingleton(() => ProductDetailBloc(
      selectedProductDetailUseCase:
          locator<GetSelectedProductDetailUseCase>()));
}
