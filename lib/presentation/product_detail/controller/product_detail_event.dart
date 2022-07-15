abstract class ProductDetailEvent {}

class ProductDetailFetchEvent extends ProductDetailEvent {
  final int productId;
  ProductDetailFetchEvent({required this.productId});
}
