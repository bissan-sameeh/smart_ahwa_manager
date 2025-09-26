import '../../models/order_model.dart';

class OrderRepository implements IOrderRepository{ // interface segregation
   List<Order> _orders = [];

  @override
  Future<void> createOrder(Order order) {
       _orders.add(order);
        return Future.value();
  }

  @override
  Future<List<Order>> getPendingOrders() {
   List <Order> pendingOrders=_orders.where((element) => element.status.name =="pending",).toList();
    return Future.value(pendingOrders);
  }

  @override
  Future<void> markOrderAsCompleted(int orderId) {
    int index = _orders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      Order order = _orders[index];
      Order updatedOrder = Order(
          order.thumbnail,
          order.description,
          order.description,
          order.category,
          order.alcoholic,
          order.customer,
          id: order.id,
          name: order.name,
          price: order.price,
          quantity: order.quantity,
          orderDate: order.orderDate,
          status: order.status);
      _orders[index] = updatedOrder;
      _orders = List.from(_orders);
    }

    return Future.value();
  }

  @override
  Future<List<Order>> getAllCompletedOrders() {
    List <Order> pendingOrders=_orders.where((element) => element.status.name =="completed",).toList();

    return Future.value(pendingOrders);
  }
}

abstract class IOrderRepository{
  Future<void> createOrder(Order order);
  Future<List<Order>? > getPendingOrders() ;
  Future<void> markOrderAsCompleted(int orderId) ;
  Future<List<Order>> getAllCompletedOrders();
}
// IS : interface segregation
//  حيث أن ال OrderRepository يطبق فقط دوال خاصة بال order
