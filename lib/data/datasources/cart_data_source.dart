import 'package:neostore/datasources/dto/cart/cart_list_response_dto.dart';

abstract class CartDataSource {
  Future<CartListResponseDto> getCartItemsList();
}
