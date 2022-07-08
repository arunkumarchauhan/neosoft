import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class ProductListingState extends Equatable {}

class ProductListInitializationState extends ProductListingState {
  @override
  List<Object?> get props => [];
}

class ProductListLoadingState extends ProductListingState {
  ProductListLoadingState();
  @override
  List<Object?> get props => [];
}

class ProductListFetchSuccessState extends ProductListingState {
  final List<ProductListItemEntity> products;
  ProductListFetchSuccessState({required this.products});
  @override
  List<Object?> get props => [products];
}

class ProductListRefetchLoadingState extends ProductListingState {
  final List<ProductListItemEntity> products;
  ProductListRefetchLoadingState({required this.products});
  @override
  List<Object?> get props => [products];
}

class ProductListFetchFailedState extends ProductListingState {
  final Failure failure;
  ProductListFetchFailedState({required this.failure});
  @override
  List<Object?> get props => [failure];
}

class ProductDetailFetchingState extends ProductListingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
