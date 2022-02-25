import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';
import 'package:flutter_pr/Pedidos/models/purchase_items.dart';
import 'package:flutter_pr/Pedidos/services/pedidos_service.dart';

enum StatePage { LOADING, DONE }

class PedidosBloc {
  PedidoService pedidoService = PedidoService();

  final _pedidosController = StreamController<StatePage>.broadcast();

  Stream<StatePage> get streamControllerPedidos => _pedidosController.stream;

  Future<List<Pedido>> getPedidos() async {
    _pedidosController.sink.add(StatePage.LOADING);
    var res =
        await pedidoService.getPedidos(0, 20).timeout(Duration(seconds: 1));
    _pedidosController.sink.add(StatePage.DONE);
    if (res.isNotEmpty) {
      return res;
    }
    return [];
  }

  void salvarPedido(String idComprador, String numeroPedido, String idProduto,
      String quantidade, GlobalKey<FormState> key, BuildContext context) {
    if (key.currentState!.validate()) {

      var novo = PedidoRequest(
        customerId: int.parse(idComprador),
        orderNumber: numeroPedido,
        purchaseItems: [
          PurchaseItems(
              productId: int.parse(idProduto), quantity: int.parse(quantidade))
        ],
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

  void changeState() {
    _pedidosController.sink.add(StatePage.LOADING);
    Future.delayed(const Duration(seconds: 1));
    _pedidosController.sink.add(StatePage.DONE);
  }

  void dispose() {
    _pedidosController.close();
  }
}
