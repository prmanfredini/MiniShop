import 'package:flutter_pr/Pedidos/models/imagem.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';

class Produto {
  final int id;
  final String name;
  final double unitPrice;
  final String packageName;
  final bool isDiscontinued;
  final String? imagemPrincipal;
  final List<Imagem>? imagens;
  final Suplier? supplier;

  Produto({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.packageName,
    required this.isDiscontinued,
    this.imagemPrincipal,
    this.imagens,
    this.supplier,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    final supplierJson = json['supplier'];
    final supplier =
        supplierJson == null ? null : Suplier.fromJson(supplierJson);
    final imgJson = json['imagens'];
    List<dynamic> imagensJson = imgJson ?? [];
    final imagens =
        imagensJson.map((dynamic json) => Imagem.fromJson(json)).toList();
    return Produto(
        id: json['id'],
        name: json['name'],
        unitPrice: json['unitPrice'],
        packageName: json['packageName'],
        isDiscontinued: json['isDiscontinued'],
        imagemPrincipal: json['imagemPrincipal'],
        imagens: imagens,
        supplier: supplier);
  }
}
