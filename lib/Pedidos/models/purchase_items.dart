class PurchaseItems {
  final int productId;
  final int quantity;

  PurchaseItems({
    required this.productId,
    required this.quantity,
  });

  factory PurchaseItems.fromJson(dynamic json) {
    return PurchaseItems(
        productId: json['productId'] as int, quantity: json['quantity'] as int);
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
      };
}
