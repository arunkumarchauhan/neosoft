import 'package:dio/dio.dart';
import 'package:neostore/data/datasources/order_data_source.dart';
import 'package:neostore/datasources/dto/order_detail/order_detail_response_dto.dart';
import 'package:neostore/datasources/dto/order_list/order_list_response_dto.dart';
import 'package:neostore/datasources/remote/api_service.dart';

class OrderApiService implements OrderDataSource {
  final ApiService _apiService;
  OrderApiService({required ApiService apiService}) : _apiService = apiService;
  Future<OrderListResponseDto> getOrdersList() async {
    String subUrl = "/orderList";

    final Response response = await _apiService.getRequest(subUrl: subUrl);

    return OrderListResponseDto.fromJson(response.data!);
  }

  Future<OrderDetailResponseDto> getOrderDetail(int orderId) async {
    String subUrl = "/orderDetail";
    Map<String, dynamic> params = {"order_id": orderId};

    final Response response =
        await _apiService.getRequest(subUrl: subUrl, params: params);
    return OrderDetailResponseDto.fromJson(response.data!);
  }
}
