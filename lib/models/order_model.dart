import 'package:smart_ahwa_manager/models/report_model.dart';

import 'customer_model.dart';
import 'drink_model.dart';
import 'order_status_model.dart';

class Order{
 final int id;
 final String name;
 final double price;
 final int quantity;
 final DateTime orderDate;
 final String thumbnail;
 final String description;
 final String instructions;
 final String category;
 final String alcoholic;
 final Customer customer;
 final Report? report;
 final Drink? drink;

 final OrderStatus status;
  Order(this.thumbnail, this.description, this.instructions, this.category, this.alcoholic, this.customer, {
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.orderDate,
    required this.status,
    this.report,
    this.drink,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['thumbnail'],
      json['description'],
      json['instructions'],
      json['category'],
      json['alcoholic'],
      Customer(
        id: json['customer']['id'],
        name: json['customer']['name'],
        email: json['customer']['email'],
        phone: json['customer']['phone'],
        address: json['customer']['address'],
        city: json['customer']['city'],
        country: json['customer']['country'],
        postalCode: json['customer']['postalCode'],
        thumbnail: json['customer']['thumbnail'],
      ),
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      orderDate: DateTime.parse(json['orderDate']),
      status: OrderStatus(
        id: json['status']['id'],
        name: json['status']['name'],
        description: json['status']['description'],
      ),
    );
  }


}


