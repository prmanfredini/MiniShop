import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/objeto_response.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';
import 'package:flutter_pr/Pedidos/models/purchase_items.dart';
import 'package:flutter_pr/Pedidos/services/pedidos_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum StatePage { LOADING, DONE }

class PedidosBloc {
  PedidoService pedidoService = PedidoService();

  final _pedidosController = StreamController<StatePage>.broadcast();
  Stream<StatePage> get streamControllerPedidos => _pedidosController.stream;

  final _pageStateStream = StreamController<PagingState<int,Pedido>>.broadcast();
  Stream<PagingState<int, Pedido>> get streamPagingState => _pageStateStream.stream;

  List<Pedido> pedidos = [];

  Future<Objeto> getPedidos(int index) async {
    print('chamando pagina $index');

    var res = await pedidoService.getPedidos(index, 10);
    pedidos.addAll(res.pedidos);
    final isLastPage = index >= res.totalPages;
    final nextPageKey = isLastPage ? null : index+1;
    _pageStateStream.sink.add(PagingState(error: null, nextPageKey: nextPageKey, itemList: pedidos));
    return res;
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
