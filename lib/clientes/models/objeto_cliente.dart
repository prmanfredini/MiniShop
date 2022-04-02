import 'package:flutter_pr/clientes/models/cliente.dart';

class ObjetoCliente {
  final List<ClienteModel> clientes;
  final int totalPages;

  ObjetoCliente({
    required this.clientes,
    required this.totalPages,
  });

  factory ObjetoCliente.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsons = json['content'];
    return ObjetoCliente(
      clientes:
          jsons.map((dynamic json) => ClienteModel.fromJson(json)).toList(),
      totalPages: json['totalPages'],
    );
  }
}
