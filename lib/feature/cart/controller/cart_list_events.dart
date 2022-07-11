abstract class CartListEvent {}

class FetchCartItemsEvent extends CartListEvent {
  @override
  String toString() {
    return "FetchCartItemsEvent";
  }
}
