import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response_by_id.dart';

class CardDetalhes extends StatelessWidget {
  PedidoById? pedido;

  CardDetalhes(this.pedido, {Key? key}) : super(key: key);

  var valor = MoneyMaskedTextController(leftSymbol: 'R\$ ');

  @override
  Widget build(BuildContext context) {
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
                      itemCount: pedido?.orderItems.length ?? 0,
                      itemBuilder: (context, index) {
                        valor.text = pedido?.orderItems[index].unitPrice.toStringAsFixed(2) ?? '0';
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(pedido?.orderItems[index].quantity
                                        .toString() ?? '0')),
                            Expanded(
                                flex: 4,
                                child: SizedBox(
                                  width: 80,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(pedido?.orderItems[index].productName
                                            .toString() ?? '0'),
                                  ),
                                )),
                            Expanded(
                              flex: 2,
                              child: Text(valor.text),
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
