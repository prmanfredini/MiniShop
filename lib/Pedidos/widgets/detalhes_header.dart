import 'package:date_format/date_format.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response_by_id.dart';


class HeaderDetalhes extends StatelessWidget {
  PedidoById? pedido;

  HeaderDetalhes(this.pedido, {Key? key}) : super(key: key);

  var valor = MoneyMaskedTextController(leftSymbol: 'R\$ ');

  @override
  Widget build(BuildContext context) {
    valor.text = pedido?.totalAmount.toStringAsFixed(2) ?? '0';
    final _data = formatDate((pedido?.orderDate ?? DateTime.now()), [dd, '/', mm, '/', yyyy]);
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
                      Text('Pedido ${pedido?.orderNumber ?? 0}'),
                      const Padding(padding: EdgeInsets.all(4)),
                      const Text(
                        'Cliente: ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                          '${pedido?.customer.firstName ?? 'Nome'} '
                              '${pedido?.customer.lastName ?? 'Sobrenome'}'),
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
                      Text(valor.text),
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
