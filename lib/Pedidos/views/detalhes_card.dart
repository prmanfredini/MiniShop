import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';

class CardDetalhes extends StatelessWidget {
  Pedido pedido;

  CardDetalhes(this.pedido);

  @override
  Widget build(BuildContext context) {
    final _data = formatDate(pedido.orderDate, [dd, '/', mm, '/', yyyy]);
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, right: 48, top: 24),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('${pedido.customer.firstName} '
                            '${pedido.customer.lastName}'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Produtos: ',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const ScrollPhysics(),
                      //     itemCount: pedido.orderItems.length,
                      //     itemBuilder: (context, index) {
                      //        return Text(pedido.orderItems[index].productId.toString());
                             Text(pedido.orderItems.first.productId.toString()),
                      //    }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Row(
                          children: [
                            const Text('Data: ',
                                style: TextStyle(color: Colors.grey)),
                            Text(_data),
                          ],
                        ),
                      ),
                      const Text(
                        'Total:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'R\$: ${pedido.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
