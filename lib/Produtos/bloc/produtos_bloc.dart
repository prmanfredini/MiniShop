import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/models/objeto_response_id.dart';
import 'package:flutter_pr/Produtos/models/produto_response.dart';
import 'package:flutter_pr/Produtos/models/produto_request.dart';
import 'package:flutter_pr/Produtos/services/produtos_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProdutosBloc {
  ProdutoService produtoService = ProdutoService();

  final _pageStateStream =
      StreamController<PagingState<int, Produto>>.broadcast();

  Stream<PagingState<int, Produto>> get streamPagingState =>
      _pageStateStream.stream;

  List<Produto> produtos = [];

  Future<ObjetoRetorno> getProdutos(int index) async {

    var res = await produtoService.getProduto(index, 10);
    produtos.addAll(res.conteudo);
    final isLastPage = index >= res.totalPages;
    final nextPageKey = isLastPage ? null : index + 1;
    _pageStateStream.sink.add(
        PagingState(error: null, nextPageKey: nextPageKey, itemList: produtos));
    return res;
  }

  Future<ObjetoRetornoById> getProdutosById(int idProduto) async {
    var res = await produtoService.getProdutoById(idProduto);
    return res;
  }

  void salvarProduto(
      String valor,
      bool active,
      String nomeProduto,
      String nomePacote,
      String supplierId,
      String imagem,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {
      var aux = valor.split(' ');
      var valorPonto = aux[1].split(',').join('.');

      var novo = ProdutoRequest(
          isDiscontinued: false,
          name: nomeProduto,
          packageName: nomePacote,
          supplierId: int.parse(supplierId),
          unitPrice: double.parse(valorPonto));

      produtoService
          .postProduto(novo)
          .then((value) => onComplete(context, value));
    }
  }

  onComplete(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Aten????o"),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  void dispose() {
  }
}
