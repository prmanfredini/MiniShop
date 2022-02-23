import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';
import 'package:flutter_pr/Pedidos/services/pedidos_service.dart';

class PedidosBloc {

  void salvarPedido(
      String idComprador,
      String numeroPedido,
      String idProduto,
      String quantidade,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {

      //get produtoById setar valorUnidade * quantidade = valorTotal do pedido
      //get produtoById setar qual produto é * quantidade = valorTotal do pedido

      var novo = Pedido(
          orderDate: DateTime.now(),
          orderNumber: '',
          quantidade: int.parse(quantidade),
          customerId: int.parse(idComprador),
      );

      PedidoService().postPedido(novo);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Atenção"),
              content: const Text('sucesso!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK")),
              ],
            );
          });
    }
  }

}