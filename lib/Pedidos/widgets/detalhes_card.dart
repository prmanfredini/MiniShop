import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Produtos'),
              const Padding(padding: EdgeInsets.all(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Qtd', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Produtos', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Valor Unitário',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: pedido.orderItems.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(pedido.orderItems[index].quantity
                                        .toString())),
                            Expanded(
                                flex: 3,
                                child: Text(pedido.orderItems[index].productId
                                        .toString())),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  'R\$ ${pedido.orderItems[index].unitPrice.toStringAsFixed(2)}'),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
