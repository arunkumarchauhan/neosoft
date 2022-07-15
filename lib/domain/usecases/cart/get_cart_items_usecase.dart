import 'package:either_dart/either.dart';
import 'package:neostore/domain/mapper/cart_mapper.dart';
import 'package:neostore/domain/repositories/cart_repository.dart';
import 'package:neostore/domain/entity/cart/cart_item_list_response_entity.dart';
import 'package:neostore/presentation/cart/model/cart_list.dart';
import 'package:neostore/utils/models/failure.dart';

class GetCartItemsUseCase {
  CartRepository _cartRepository;
  GetCartItemsUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;
  Future<Either<Failure, CartList>> getCartItemsList() async {
    final response = await _cartRepository.getCartItemsList();
    if (response.isLeft) {
      return Left(response.left);
    }
    return Right(response.right.mapToPresentation());
  }
}
