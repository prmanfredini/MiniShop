
import 'package:flutter_pr/Produtos/models/suplier.dart';

class Produto {
  final int id;
  final String name;
  final Suplier supplier;
  final double unitPrice;

  Produto({
    required this.id,
    required this.name,
    required this.supplier,
    required this.unitPrice,
  });

  Produto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        supplier = Suplier.fromJson(json['supplier']),
        unitPrice = json['unitPrice'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'supplier': supplier.toJson(),
        'unitPrice': unitPrice,
      };
}


