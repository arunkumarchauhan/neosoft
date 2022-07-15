import 'package:equatable/equatable.dart';
import 'package:neostore/presentation/product_listing/controller/product_listing_state.dart';

abstract class ProductListingEvent extends Equatable {}

class InitiateProductListFetchEvent extends ProductListingEvent {
  int productCategoryId;
  int limit;
  int page;
  @override
  String toString() =>
      "InitiateProductListFetchEvent: params :  {productCategoryId : $productCategoryId , limit : $limit, page : $page}";
  InitiateProductListFetchEvent(
      {this.productCategoryId = 1, this.limit = 10, this.page = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [productCategoryId, limit, page];
}

class FetchProductDetail extends ProductListingEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchMoreProductsListEvent extends ProductListingEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
