import 'package:flutter_pr/Produtos/models/suplier.dart';

class Produto {
  final int id;
  final String name;
  final double unitPrice;
  final String packageName;
  final bool isDiscontinued;
  final String? imagemPrincipal;
  final Suplier? supplier;

  Produto({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.packageName,
    required this.isDiscontinued,
    this.imagemPrincipal,
    this.supplier,
  });

  factory Produto.fromJson(Map<String, dynamic> json){
    final supplierJson = json['supplier'];
    final supplier = supplierJson == null ? null : Suplier.fromJson(supplierJson);
    return Produto(
        id : json['id'],
        name : json['name'],
        unitPrice : json['unitPrice'],
        packageName : json['packageName'],
        isDiscontinued : json['isDiscontinued'],
        imagemPrincipal : json['imagemPrincipal'],
        supplier : supplier);
  }

}

