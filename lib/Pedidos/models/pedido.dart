
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'order.dart';

class Pedido {
  final int? id;
  final ClienteModel? customer;
  final int? customerId;
  final DateTime orderDate;
  final List<Order>? orderItems;
  final String orderNumber;
  final double? totalAmount;
  final int? productId;
  final int? quantidade;

  Pedido({
    this.id,
    this.customer,
    this.customerId,
    required this.orderDate,
    this.orderItems,
    required this.orderNumber,
    this.totalAmount,
    this.productId,
    this.quantidade,
  });


  Pedido.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        customer = ClienteModel.fromJson(json['customer']),
        customerId = ClienteModel.fromJson(json['customer']).id,
        orderDate = json['orderDate'],
        orderItems = [Order.fromJson(json['orderItems'])],
        orderNumber = json['orderNumber'],
        productId = Produto.fromJson(json['orderNumber']).id,
        totalAmount = json['totalAmount'],
        quantidade = Order.fromJson(json['orderItems']).quantity;

  Map<String, dynamic> toJson() => {
        //'id': id,
        //'customer': customer.toJson(),
        //'orderDate': orderDate,
        //'orderItems': orderItems.toList(),
        'customerId': customerId,
        'orderNumber': orderNumber,
        'purchaseItems': [{'productId' : productId, 'quantity' : totalAmount}],
        //'totalAmount': totalAmount
      };
}
