import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/repositories/orders/order.dart';

import '../../controllers/orders_services/order.dart';

class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({super.key});

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  OrderService? orderServiceImp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("pending orders"),),
      body: Column(),
    );
  }
}
