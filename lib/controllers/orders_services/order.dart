import 'package:smart_ahwa_manager/repositories/orders/order.dart';
import '../../models/drink_model.dart';
import '../../models/order_model.dart';
//
// فعليا فصلت كل كلاس SR بحيث انه فصلت  ال controller
// reps و models ,


class OrderServiceImp implements OrderService {
  final OrderRepository orderRepository; // هنا استخدمت  dependency inversion بحيث ما بنيت الاوبجيكت كامل هنا وما خليت الكلاس معتمد عليه بل مررته تمرير بالكونستركتور بحيث هنا فصلت منطق العمل وحتى لو تغيرت order service هبضل هان شغال وهيك فصلنا اللوجيك هان عن كلاس الخدمات
  OrderServiceImp({required this.orderRepository});

  @override
  Future<MapEntry<String, int>>  calculateTopSellingDrinks() async {
   List<Order> completedOrders= await orderRepository.getAllCompletedOrders();
   Map<String,int> drinksCount= {};
   for(var order in completedOrders) {
     if (drinksCount.containsKey(order.drink!
         .name)) { //اذا العنصر موجود بنزيد الكمية الموجودة مع الكمية الجديدة للمشروب
       drinksCount[order.drink!.name] =
           drinksCount[order.drink!.name]! + order.quantity;
     } else { // اذا لا بنحط الكمية كلها هان
       drinksCount[order.drink!.name] = order.quantity;
     }
     // شاي 1
     //شاي 2
     //قهوة 1
     //شاي 3
   }
     List<MapEntry<String,int>> drinks= drinksCount.entries.map((row) =>row ,).toList(); //[("tea":1 ,"latte":5,"coffee":2)]
     drinks.sort((a, b) => b.value.compareTo(a.value)); //تنازليا
    return drinks.first ;





  


  }

  @override
  Future<int> calculateTotalOrders() async {
    List<Order> completedOrders= await orderRepository.getAllCompletedOrders();
   return completedOrders.length;
  }






}

abstract class OrderService {
  Future<MapEntry<String, int>> calculateTopSellingDrinks();
  Future<int> calculateTotalOrders();
}