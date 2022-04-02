import 'package:flutter_pr/clientes/models/cliente.dart';

import 'order_items.dart';

class PedidoById {
  final int id;
  final DateTime orderDate;
  final String orderNumber;
  final double totalAmount;
  final ClienteModel customer;
  final List<OrderItems> orderItems;

  PedidoById({
    required this.id,
    required this.orderDate,
    required this.orderNumber,
    required this.totalAmount,
    required this.customer,
    required this.orderItems,
  });

  factory PedidoById.fromJson(Map<String, dynamic> json) {
    List<dynamic> orderItems = json['orderItems'];
    return PedidoById(
      id: json['id'],
      orderDate: DateTime.parse(json['orderDate']),
      orderNumber: json['orderNumber'],
      totalAmount: json['totalAmount'],
      customer: ClienteModel.fromJson(json['customer']),
      orderItems: orderItems.map((json) => OrderItems.fromJson(json)).toList(),
    );
  }
}

