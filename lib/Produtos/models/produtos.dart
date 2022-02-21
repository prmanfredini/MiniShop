class Produto {
  final id;
  final productName;
  final supplieId;
  final unitPrice;
  final packageName;

  Produto({
    this.id,
    this.productName,
    this.supplieId,
    this.unitPrice,
    this.packageName,
  });

  Produto.fromJson(Map<String, dynamic> json)
      : id = 0,
        productName = json['productName'],
        supplieId = json['supplieId'],
        unitPrice = json['unitPrice'],
        packageName = json['packageName'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'productName': productName,
    'supplieId': supplieId,
    'unitPrice': unitPrice,
    'packageName': packageName,
  };

}
