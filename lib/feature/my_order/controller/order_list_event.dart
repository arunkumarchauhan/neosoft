abstract class OrderListingEvent {}

class FetchOrderListEvent extends OrderListingEvent {
  @override
  String toString() {
    return "FetchOrderListEvent";
  }
}
