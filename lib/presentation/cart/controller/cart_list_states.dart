import 'package:equatable/equatable.dart';
import 'package:neostore/presentation/cart/model/cart_list.dart';
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
  final CartList cart;
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
