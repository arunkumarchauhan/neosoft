import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neostore/core/product/data/datasource/product_api_service.dart';
import 'package:neostore/core/product/domain/repository/product_repository_implementation.dart';
import 'package:neostore/core/product/domain/usecases/get_selected_category_product_list.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/services/api_service.dart';

void inject() {
  final locator = GetIt.instance;
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(
      () => ProductApiService(apiService: locator<ApiService>()));
  locator.registerLazySingleton(() => ProductRepositoryImplementation(
      productApiService: locator<ProductApiService>()));
  locator.registerLazySingleton(() => GetSelectedCategoryProductListUseCase(
      productRepository: locator<ProductRepositoryImplementation>()));

  locator.registerLazySingleton(() => ProductListingBloc(
        getSelectedCategoryProductListUseCase:
            locator<GetSelectedCategoryProductListUseCase>(),
      ));
}
