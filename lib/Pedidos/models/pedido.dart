import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';

class Pedido {
  final int id;
  final String customer;
  final DateTime orderDate;
  final Produto orderItems;
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
        customer = json['customer'],
        orderDate = json['orderDate'],
        orderItems = json['orderItems'],
        orderNumber = json['orderNumber'],
        totalAmount = json['totalAmount'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer': customer,
        'orderDate': orderDate,
        'orderItems': orderItems,
        'orderNumber': orderNumber,
        'totalAmount': totalAmount
      };
}
