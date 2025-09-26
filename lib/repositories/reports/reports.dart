import 'package:smart_ahwa_manager/models/order_model.dart';

import '../../models/report_model.dart';

class Reports implements IReportsRepository{ //single repository
  @override
  List<Report?> generateReport(List<Order> orders) {
    List<Report?> reports = orders.map((e) => e.report ).toList()  ;
    return  reports;
  }
}

abstract class IReportsRepository {
  List<Report?> generateReport(List<Order> orders);
}