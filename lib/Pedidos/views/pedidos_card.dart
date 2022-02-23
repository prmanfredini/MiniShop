import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';

import 'detalhes_view.dart';

class CardPedidos extends StatelessWidget {
  Pedido? pedido;

  CardPedidos(this.pedido);

  @override
  Widget build(BuildContext context) {
    final _data = formatDate(pedido!.orderDate, [dd, '/', mm, '/', yyyy]);
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, right: 48, top: 24),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DetalhesPedido(pedido!)));
                },
                child: Visibility(
                  visible: pedido != null,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cliente: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  '${pedido?.customer.firstName ?? 'nome'} '
                                  '${pedido?.customer.lastName ?? 'sobrenome'}'),
                            ),
                            const Text(
                              'Qnt. de Produtos: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  pedido?.orderItems.length.toString() ?? '0'),
                            ),
                            const Text(
                              'Data: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(_data),
                            ),
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
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  'R\$: ${pedido?.totalAmount.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: pedido == null,
                child: const Card(
                  child: Text('Não há pedidos cadastrados'),
                )),
          ],
        ),
      ),
    );
  }
}
