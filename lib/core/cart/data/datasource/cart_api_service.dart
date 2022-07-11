import 'package:dio/dio.dart';
import 'package:neostore/core/cart/data/dto/cart_list_response_dto.dart';
import 'package:neostore/core/orders/data/dto/order_detail_response_dto.dart';
import 'package:neostore/core/orders/data/dto/order_list_response_dto.dart';
import 'package:neostore/services/api_service.dart';

class CartApiService {
  final ApiService _apiService;
  CartApiService({required ApiService apiService}) : _apiService = apiService;
  Future<CartListResponseDto> getCartItemsList() async {
    String subUrl = "/cart";

    final Response response = await _apiService.getRequest(subUrl: subUrl);

    return CartListResponseDto.fromJson(response.data!);
  }
}
