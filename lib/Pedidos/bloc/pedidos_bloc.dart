import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/objeto_response.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response_by_id.dart';
import 'package:flutter_pr/Pedidos/models/purchase_items.dart';
import 'package:flutter_pr/Pedidos/services/pedidos_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PedidosBloc {
  PedidoService pedidoService = PedidoService();

  final _pageStateStream =
      StreamController<PagingState<int, Pedido>>.broadcast();

  Stream<PagingState<int, Pedido>> get streamPagingState =>
      _pageStateStream.stream;

  List<Pedido> pedidos = [];

  Future<Objeto> getPedidos(int index) async {

    var res = await pedidoService.getPedidos(index, 10);
    pedidos.addAll(res.pedidos);
    final isLastPage = index >= res.totalPages;
    final nextPageKey = isLastPage ? null : index + 1;

    _pageStateStream.sink.add(
        PagingState(error: null, nextPageKey: nextPageKey, itemList: pedidos));
    return res;
  }

  Future<PedidoById> getPedidosById(int idPedido) async {
    var res = await pedidoService.getPedidosById(idPedido);
    return res;
  }

  void salvarPedido(
      String idComprador,
      String numeroPedido,
      String idProduto,
      String quantidade,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {
      var novo = PedidoRequest(
        customerId: int.parse(idComprador),
        orderNumber: numeroPedido,
        purchaseItems: [
          PurchaseItems(
              productId: int.parse(idProduto), quantity: int.parse(quantidade))
        ],
      );

      pedidoService
          .postPedido(novo)
          .then((value) => onComplete(context, value));
    }
  }

  onComplete(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  void dispose() {
    _pageStateStream.close();
  }
}
