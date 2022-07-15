import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

import 'package:neostore/domain/usecases/cart/get_cart_items_usecase.dart';
import 'package:neostore/domain/usecases/order/get_order_detail_usecase.dart';
import 'package:neostore/domain/usecases/order/get_orders_list_usecase.dart';
import 'package:neostore/datasources/remote/implementation/user_api_service.dart';
import 'package:neostore/data/repositories/cart_repository_implementation.dart';
import 'package:neostore/data/repositories/order_repository_implementation.dart';
import 'package:neostore/data/repositories/user_repository_implementation.dart';
import 'package:neostore/datasources/remote/implementation/cart_api_service.dart';
import 'package:neostore/datasources/remote/implementation/order_api_service.dart';
import 'package:neostore/presentation/cart/controller/cart_list_bloc.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_bloc.dart';
import 'package:neostore/presentation/user/controller/edit_profile/edit_profile_bloc.dart';
import 'package:neostore/presentation/user/controller/forgot_password/forgot_password_bloc.dart';
import 'package:neostore/presentation/user/controller/login_controller/login_bloc.dart';
import 'package:neostore/datasources/remote/implementation/product_api_service.dart';
import 'package:neostore/data/repositories/product_repository_implementation.dart';
import 'package:neostore/domain/usecases/product/get_selected_category_product_list.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/datasources/remote/api_service.dart';
import 'package:neostore/domain/usecases/product/get_selected_product_detail.dart';
import 'package:neostore/presentation/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/presentation/user/controller/reset_password/reset_password_bloc.dart';
import 'package:neostore/presentation/user/controller/user_register_controller/user_register_bloc.dart';

final locator = GetIt.instance;
void inject() {
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => Logger());
  locator.registerLazySingleton(() => ApiService(dio: locator<Dio>()));

  //Login Injection
  locator.registerLazySingleton(() => UserApiService(Dio()));
  locator.registerLazySingleton(() =>
      UserRepoRetroImplementation(remoteDatSource: locator<UserApiService>()));
  locator.registerLazySingleton(() => LoginBloc(
      userRepoImplementation: locator<UserRepoRetroImplementation>()));

  //Product List Injection
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

  // Product Detail Injection
  locator.registerLazySingleton(() => GetSelectedProductDetailUseCase(
      productRepository: locator<ProductRepositoryImplementation>()));
  locator.registerLazySingleton(() => ProductDetailBloc(
      selectedProductDetailUseCase:
          locator<GetSelectedProductDetailUseCase>()));

  //Order List Injection
  locator.registerLazySingleton(
      () => OrderApiService(apiService: locator<ApiService>()));
  locator.registerLazySingleton(() => OrderRepositoryImplementation(
      orderApiService: locator<OrderApiService>()));
  locator.registerLazySingleton(() => GetOrderstListUseCase(
      orderRepository: locator<OrderRepositoryImplementation>()));

  locator.registerLazySingleton(() => OrderListingBloc(
        getOrderstListUseCase: locator<GetOrderstListUseCase>(),
      ));

  // Order detail injection
  locator.registerLazySingleton(() => GetSelectedOrderDetailUseCase(
      orderRepository: locator<OrderRepositoryImplementation>()));

  locator.registerLazySingleton(() => OrderDetailBloc(
      getSelectedOrderDetailUseCase: locator<GetSelectedOrderDetailUseCase>()));

// Cart Injection
  locator.registerLazySingleton(
      () => CartApiService(apiService: locator<ApiService>()));
  locator.registerLazySingleton(() =>
      CartRepositoryImplementation(cartApiService: locator<CartApiService>()));
  locator.registerLazySingleton(() => GetCartItemsUseCase(
      cartRepository: locator<CartRepositoryImplementation>()));

  locator.registerLazySingleton(
      () => CartListBloc(cartItemsUseCase: locator<GetCartItemsUseCase>()));

  //User Register Injection
  locator.registerLazySingleton(() => UserRegistrationBloc());

  //Forgot Password Injection

  locator.registerLazySingleton(() => ForgotPasswordBloc());

  //Reset Password Injection
  locator.registerLazySingleton(() => ResetPasswordBloc());

  // Edit Profile Injection
  locator.registerLazySingleton(() => EditProfileBloc());
}
