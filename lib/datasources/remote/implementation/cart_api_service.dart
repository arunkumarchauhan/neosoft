import 'package:dio/dio.dart';
import 'package:neostore/data/datasources/cart_data_source.dart';
import 'package:neostore/datasources/dto/cart/cart_list_response_dto.dart';
import 'package:neostore/datasources/remote/api_service.dart';

class CartApiService implements CartDataSource {
  final ApiService _apiService;
  CartApiService({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<CartListResponseDto> getCartItemsList() async {
    String subUrl = "/cart";

    final Response response = await _apiService.getRequest(subUrl: subUrl);

    return CartListResponseDto.fromJson(response.data!);
  }
}
