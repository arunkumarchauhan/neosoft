import 'package:neostore/datasources/dto/cart/cart_list_response_dto.dart';
import 'package:neostore/domain/entity/cart/cart_item_list_response_entity.dart';

// class CartMapper {
//   static CartListItemResponseEntity
//       mapCartListResponseDtoToCartListItemResponseEntity(
//           CartListResponseDto dto) {
//     return CartListItemResponseEntity.fromMap(dto.toMap());
//   }
// }

extension CartListMapper on CartListResponseDto {
  CartListItemResponseEntity mapToEntity() {
    return CartListItemResponseEntity.fromMap(toMap());
  }
}
