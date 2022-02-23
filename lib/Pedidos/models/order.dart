class Order {
  final int id;
  final int productId;
  final int quantity;
  final double unitPrice;

  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  factory Order.fromJson(dynamic json) {
      return Order(id: json['id'],
          productId: json['productId'] as int,
          quantity: json['quantity'] as int,
          unitPrice: json['unitPrice'] as double);
       // : id = json['id'],
       //  productId = json['productId'],
       //  quantity = json['quantity'],
       //  unitPrice = json['unitPrice']
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'productId': productId,
    'quantity': quantity,
    'unitPrice': unitPrice,
  };
}