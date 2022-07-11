abstract class OrderDetailEvent {}

class FetchOrderDetailEvent extends OrderDetailEvent {
  int orderId;
  FetchOrderDetailEvent({required this.orderId});
  @override
  String toString() {
    return "FetchOrderDetailEvent";
  }
}
