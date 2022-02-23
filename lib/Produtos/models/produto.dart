
import 'package:flutter_pr/Produtos/models/suplier.dart';

class Produto {
  final int id;
  final String imagemPrincipal;
  final bool isDiscontinued;
  final String name;
  final String packageName;
  final Suplier supplier;
  final double unitPrice;

  Produto({
    required this.id,
    required this.imagemPrincipal,
    required this.isDiscontinued,
    required this.name,
    required this.packageName,
    required this.supplier,
    required this.unitPrice,
  });

  Produto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imagemPrincipal = json['imagemPrincipal'],
        isDiscontinued = json['isdiscontinued'],
        packageName = json['packageName'],
        name = json['name'],
        supplier = Suplier.fromJson(json['supplier']),
        unitPrice = json['unitPrice'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'imagemPrincipal': imagemPrincipal,
        'isDiscontinued': isDiscontinued,
        'packageName': packageName,
        'name': name,
        'supplier': supplier.toJson(),
        'unitPrice': unitPrice,

      };
}


