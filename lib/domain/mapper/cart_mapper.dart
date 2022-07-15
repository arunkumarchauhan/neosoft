import 'package:neostore/domain/entity/cart/cart_item_list_response_entity.dart';
import 'package:neostore/presentation/cart/model/cart_list.dart';

extension CartListMapper on CartListItemResponseEntity {
  CartList mapToPresentation() {
    return CartList.fromMap(toMap());
  }
}
