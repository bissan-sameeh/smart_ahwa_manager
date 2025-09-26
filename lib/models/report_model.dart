import 'package:smart_ahwa_manager/models/order_model.dart';

class Report {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String status;

  Report( {
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });
}