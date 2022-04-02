import 'package:flutter_pr/fornecedores/models/fornecedor.dart';

class ObjetoFornecedor {
  final List<Fornecedor> fornecedores;
  final int totalPages;

  ObjetoFornecedor({
    required this.fornecedores,
    required this.totalPages,
  });

  factory ObjetoFornecedor.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsons = json['content'];
    return ObjetoFornecedor(
      fornecedores:
          jsons.map((dynamic json) => Fornecedor.fromJson(json)).toList(),
      totalPages: json['totalPages'],
    );
  }
}
