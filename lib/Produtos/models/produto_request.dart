import 'package:flutter_pr/Produtos/models/suplier.dart';

class ProdutoRequest {
  final bool isDiscontinued;
  final String name;
  final String packageName;
  final int supplierId;
  final double unitPrice;

  ProdutoRequest({
    required this.isDiscontinued,
    required this.name,
    required this.packageName,
    required this.supplierId,
    required this.unitPrice,
  });

  factory ProdutoRequest.fromJson(Map<String, dynamic> json)
  {
    return ProdutoRequest(
        isDiscontinued: json['isdiscontinued'],
        name: json['name'],
        packageName: json['packageName'],
        supplierId: json['supplierId'],
        unitPrice: json['unitPrice']);}


  Map<String, dynamic> toJson() => {
    'isDiscontinued': isDiscontinued,
    'name': name,
    'packageName': packageName,
    'supplierId': supplierId,
    'unitPrice': unitPrice,
  };

}


