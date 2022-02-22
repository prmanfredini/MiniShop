
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'order.dart';

class Pedido {
  final int id;
  final ClienteModel customer;
  final DateTime orderDate;
  final Order orderItems;
  final String orderNumber;
  final double totalAmount;

  Pedido(
      this.id,
      this.customer,
      this.orderDate,
      this.orderItems,
      this.orderNumber,
      this.totalAmount);

  Pedido.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        customer = ClienteModel.fromJson(json['customer']),
        orderDate = json['orderDate'],
        orderItems = Order.fromJson(json['orderItems']),
        orderNumber = json['orderNumber'],
        totalAmount = json['totalAmount'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer': customer.toJson(),
        'orderDate': orderDate,
        'orderItems': orderItems.toJson(),
        'orderNumber': orderNumber,
        'totalAmount': totalAmount
      };
}
