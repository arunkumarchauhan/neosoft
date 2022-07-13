import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neostore/services/api_service.dart';
import './product/domain/di/product_list_injection.dart'
    as product_list_injection;
import './product/domain/di/product_detail_injection.dart'
    as product_detail_injection;

import './orders/domain/di/order_list_injection.dart' as orders_list_injection;

import './orders/domain/di/order_detail_injection.dart'
    as order_detail_injection;
import './cart/domain/di/cart_item_list_injection.dart' as cart_injection;
import './user/domain/di/login_injection.dart' as login_injection;
import './user/domain/di/register_injection.dart' as register_injection;
import './user/domain/di/forget_password_injection.dart'
    as forget_pass_injection;
import './user/domain/di/reset_password_injection.dart' as reset_pass_injection;
import './user/domain/di/edit_profile_injection.dart' as edit_profile_injection;

final locator = GetIt.instance;
void inject() {
  // var _dio = Dio(BaseOptions(contentType: "application/json"));
  // _dio
  //   ..interceptors
  //       .add(InterceptorsWrapper(onRequest: (RequestOptions options, _) {
  //     print("Interceptor Request ${options.uri}");
  //   }, onResponse: (Response response, _) {
  //     print("Interceptor Response ${response.data}");
  //   }, onError: (DioError error, _) {
  //     print("Interceptor Error : ${error}");
  //   }));
  // locator.registerLazySingleton(() => _dio);
  login_injection.inject();

  locator.registerLazySingleton(() => ApiService());
  product_list_injection.inject();
  product_detail_injection.inject();
  orders_list_injection.inject();
  order_detail_injection.inject();
  cart_injection.inject();
  register_injection.inject();
  forget_pass_injection.inject();
  reset_pass_injection.inject();
  edit_profile_injection.inject();
}
