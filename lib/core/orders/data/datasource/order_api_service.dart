import 'package:dio/dio.dart';
import 'package:neostore/core/orders/data/dto/order_detail_response_dto.dart';
import 'package:neostore/core/orders/data/dto/order_list_response_dto.dart';
import 'package:neostore/services/api_service.dart';

class OrderApiService {
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
