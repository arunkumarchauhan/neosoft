import 'package:either_dart/either.dart';
import 'package:neostore/core/cart/data/repository/cart_repository.dart';
import 'package:neostore/core/cart/domain/entity/cart_item_list_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

class GetCartItemsUseCase {
  CartRepository _cartRepository;
  GetCartItemsUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;
  Future<Either<Failure, CartListItemResponseEntity>> getCartItemsList() {
    return _cartRepository.getCartItemsList();
  }
}
