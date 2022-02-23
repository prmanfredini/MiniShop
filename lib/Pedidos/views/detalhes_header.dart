import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';

import 'detalhes_view.dart';

class HeaderDetalhes extends StatelessWidget {
  Pedido pedido;

  HeaderDetalhes(this.pedido);

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pedido ${pedido.orderNumber}'),
                      const Padding(padding: EdgeInsets.all(4)),
                      const Text(
                        'Cliente: ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                          '${pedido.customer.firstName} '
                              '${pedido.customer.lastName}'),
                      const Padding(padding: EdgeInsets.all(4)),
                      const Text(
                        'Data: ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(_data),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                          'R\$: ${pedido.totalAmount.toStringAsFixed(2)}'),
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
