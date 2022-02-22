class Produto {
  final int id;
  final String productName;
  final int supplieId;
  final double unitPrice;
  final String packageName;
  final ProductImage? path;

  Produto({
    required this.id,
    required this.productName,
    required this.supplieId,
    required this.unitPrice,
    required this.packageName,
    this.path,
  });

  Produto.fromJson(Map<String, dynamic> json)
      : id = 0,
        productName = json['productName'],
        supplieId = json['supplieId'],
        unitPrice = json['unitPrice'],
        packageName = json['packageName'],
        path = ProductImage.fromJson(json['productImage']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'supplieId': supplieId,
        'unitPrice': unitPrice,
        'packageName': packageName,
        'path': path?.toJson() ?? ''
      };
}

class ProductImage {
  //final double id;
  //final double seqExibicao;
  final String path;

  ProductImage(
      // this.id,
      // this.seqExibicao,
      this.path);

  ProductImage.fromJson(Map<String, dynamic> json)
      : //id = json["id"],
        //seqExibicao = json["seqExibicao"],
        path = json["path"];

  Map<String, dynamic> toJson() => {""
      // "id": id,
      // "seqExibicao": seqExibicao,
      "path": path};
}
