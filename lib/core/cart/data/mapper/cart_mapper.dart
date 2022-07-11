import 'package:neostore/core/cart/data/dto/cart_list_response_dto.dart';
import 'package:neostore/core/cart/domain/entity/cart_item_list_response_entity.dart';

class CartMapper {
  static CartListItemResponseEntity
      mapCartListResponseDtoToCartListItemResponseEntity(
          CartListResponseDto dto) {
    return CartListItemResponseEntity.fromMap(dto.toMap());
  }
}
