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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Produtos'),
              Padding(padding: EdgeInsets.all(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Qtd', style: TextStyle(color: Colors.grey)),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const ScrollPhysics(),
                      //     itemCount: pedido.orderItems.length,
                      //     itemBuilder: (context, index) {
                      //        return Text(pedido.orderItems[0].productId.toString());
                      Text(pedido.orderItems.first.quantity.toString()),
                      //     }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Produtos',style: TextStyle(color: Colors.grey)),
                      Text(pedido.orderItems.first.productId.toString()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Valor Unitário', style: TextStyle(color: Colors.grey)),
                      Text('R\$ ${pedido.orderItems.first.unitPrice.toString()}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
