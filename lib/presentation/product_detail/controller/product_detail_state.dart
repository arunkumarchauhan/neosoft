import 'package:equatable/equatable.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/presentation/product_detail/model/product.dart';
import 'package:neostore/utils/models/failure.dart';

abstract class ProductDetailState extends Equatable {}

class ProductDetailInitState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadingState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailFetchSuccessState extends ProductDetailState {
  final Product product;
  ProductDetailFetchSuccessState({required this.product});

  @override
  List<Object?> get props => [product];
}

class ProductDetailFetchFailureState extends ProductDetailState {
  final Failure failure;
  ProductDetailFetchFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
