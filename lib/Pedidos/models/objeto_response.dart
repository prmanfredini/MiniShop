import 'package:flutter_pr/Pedidos/models/pedido_response.dart';

class Objeto {
  final List<Pedido> pedidos;
  final int totalPages;

  Objeto({
    required this.pedidos,
    required this.totalPages,
  });

  factory Objeto.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsons = json['content'];
    return Objeto(
      pedidos: jsons.map((dynamic json) => Pedido.fromJson(json)).toList(),
      totalPages: json['totalPages'],
    );
  }
}
