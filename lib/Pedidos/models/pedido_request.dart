
import 'purchase_items.dart';

class PedidoRequest {
  final int customerId;
  final String orderNumber;
  final List<PurchaseItems>? purchaseItems;


  PedidoRequest({
    required this.customerId,
    this.purchaseItems,
    required this.orderNumber,
  });



  Map<String, dynamic> toJson() => {
    'customerId': customerId,
    'orderNumber': orderNumber,
    'purchaseItems': [purchaseItems?[0].productId, purchaseItems?[0].quantity],
  };
}
