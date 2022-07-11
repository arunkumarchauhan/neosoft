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

final locator = GetIt.instance;
void inject() {
  var _dio = Dio(BaseOptions(contentType: "application/json"));
  _dio
    ..interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, _) {
      print("Interceptor Request ${options.uri}");
    }, onResponse: (Response response, _) {
      print("Interceptor Response ${response.data}");
    }, onError: (DioError error, _) {
      print("Interceptor Error : ${error}");
    }));
  locator.registerLazySingleton(() => _dio);

  locator.registerLazySingleton(() => ApiService());

  product_list_injection.inject();
  product_detail_injection.inject();
  orders_list_injection.inject();
  order_detail_injection.inject();
}
