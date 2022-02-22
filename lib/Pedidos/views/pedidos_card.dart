import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';

class CardPedidos extends StatelessWidget {
  Pedido? pedido;
  CardPedidos(this.pedido);

  @override
  Widget build(BuildContext context) {
  final _data =  formatDate(pedido!.orderDate, [dd, '/', mm, '/', yyyy]);
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Visibility(
            visible: pedido != null,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_data),
                  Text('${pedido?.customer.firstName ?? 'nome'} '
                      '${pedido?.customer.lastName ?? 'sobrenome'}'),
                  Text(
                    'R\$: ${pedido?.totalAmount.toStringAsFixed(2)}'),
                ],
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
    );
  }
}
