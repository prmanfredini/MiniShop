import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/produto_request.dart';
import 'package:flutter_pr/Produtos/services/produtos_service.dart';

class ProdutosBloc {
  ProdutoService produtoService = ProdutoService();

  Future<List<Produto>> getProdutos() async {
    var res = await produtoService.getProduto(0,20);
    print('resBloc = ${res.toList()}');
    if (res.isNotEmpty) {
      return res;
    }
    return [];
  }

  void EditProduto(
      int id,
      bool ativo,
      String nome,
      String nomePacote,
      String supplierId,
      String unitPrice,
      GlobalKey<FormState> key,
      BuildContext context
      ){
    if (key.currentState!.validate()) {
      var aux = unitPrice.split(':');
      var valorPonto = aux[1].split(',').join('.');

      var novo = ProdutoRequest(
              isDiscontinued: ativo,
              name: nome,
              packageName: nomePacote,
              supplierId: int.parse(supplierId),
              unitPrice: double.parse(valorPonto));

      produtoService.putProduto(novo, id).then((value) => onComplete(context, value));
    }
  }

  void salvarProduto(
      String valor,
      String nomeProduto,
      String nomePacote,
      String supplierId,
      String imagem,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {
      var aux = valor.split(':');
      var valorPonto = aux[1].split(',').join('.');

      var novo = ProdutoRequest(
          isDiscontinued: false,
          name: nomeProduto,
          packageName: nomePacote,
          supplierId: int.parse(supplierId),
          unitPrice: double.parse(valorPonto));

      ProdutoService().postProduto(novo).then((value) => onComplete(context, value));


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
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }
}
