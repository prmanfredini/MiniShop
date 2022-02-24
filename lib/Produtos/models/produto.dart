import 'package:flutter_pr/Produtos/models/suplier.dart';

class Produto {
  final int id;
  final String name;
  final double unitPrice;
  final String packageName;
  final bool isDiscontinued;
  final String? imagemPrincipal;
  //final Suplier? supplier;

  Produto({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.packageName,
    required this.isDiscontinued,
    this.imagemPrincipal,
    // this.supplier,
  });

  factory Produto.fromJson(Map<String, dynamic> json)
  {
      return Produto(
          id: json['id'],
          name: json['name'],
          unitPrice: json['unitPrice'],
          packageName: json['packageName'],
          isDiscontinued: json['isdiscontinued'],
          //supplier: Suplier.fromJson(json['supplier']),
      );}
      //   : id = json['id'],
      //   name = json['name'],
      //   unitPrice = json['unitPrice'],
      //   packageName = json['packageName'],
      //   isDiscontinued = json['isdiscontinued'],
      //   imagemPrincipal = json['imagemPrincipal'];
      //   // supplier = Suplier.fromJson(json['supplier']),
      //   // supplierId = Suplier.fromJson(json['supplier']).id;

  // Map<String, dynamic> toJson() => {
  //       //'id': id,
  //       //'imagemPrincipal': imagemPrincipal,
  //       'isDiscontinued': isDiscontinued,
  //       'packageName': packageName,
  //       'name': name,
  //       //'supplier': supplier?.toJson(),
  //       //'supplierId': supplierId,
  //       'unitPrice': unitPrice,
  //     };

}


