class OrderItems {
  final int id;
  final int productId;
  final double unitPrice;
  final int quantity;
  final String productName;

  OrderItems({
    required this.id,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
    required this.productName,
  });

  factory OrderItems.fromJson(dynamic json) {
    return OrderItems(
      id: json['id'],
      productId: json['productId'],
      unitPrice: json['unitPrice'],
      quantity: json['quantity'],
      productName: json['productName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'productName': productName,
      };
}
