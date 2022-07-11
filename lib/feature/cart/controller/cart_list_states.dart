import 'package:equatable/equatable.dart';
import 'package:neostore/core/cart/domain/entity/cart_item_list_response_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class CartListState extends Equatable {}

class CartListInitState extends CartListState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "CartListInitState";
  }
}

class CartListLoadingState extends CartListState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "CartListLoadingState";
  }
}

class CartListFetchSuccessfulState extends CartListState {
  final CartListItemResponseEntity cart;
  CartListFetchSuccessfulState({required this.cart});
  @override
  List<Object?> get props => [cart];
  @override
  String toString() {
    return "CartListFetchSuccessfulState : Cart Items Length : ${cart.productMetaEntity?.length}";
  }
}

class CartListFetchFailedState extends CartListState {
  final Failure failure;
  CartListFetchFailedState({required this.failure});
  @override
  List<Object?> get props => [failure];
  @override
  String toString() {
    return "CartListFetchSuccessfulState Failure Message : ${failure.message}";
  }
}
