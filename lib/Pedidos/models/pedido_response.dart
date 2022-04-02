import 'package:flutter_pr/clientes/models/cliente_by_id.dart';

class Pedido {
  final int id;
  final DateTime orderDate;
  final double totalAmount;
  final Cliente customer;
  final int quantidadeProdutos;

  Pedido({
    required this.id,
    required this.orderDate,
    required this.totalAmount,
    required this.customer,
    required this.quantidadeProdutos,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      orderDate: DateTime.parse(json['orderDate']),
      totalAmount: json['totalAmount'],
      customer: Cliente.fromJson(json['customerId']),
      quantidadeProdutos: json['quantidadeProdutos'],
    );
  }
}


