import 'package:either_dart/either.dart';
import 'package:neostore/domain/entity/cart/cart_item_list_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, CartListItemResponseEntity>> getCartItemsList();
}
