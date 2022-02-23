import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/services/produtos_service.dart';

class ProdutosBloc {

  void salvarProduto(String valor,
      String nomeProduto,
      String nomePacote,
      String idFornecedor,
      String imagem,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {
      var aux = valor.split(':');
      var valorPonto = aux[1].split(',').join('.');
      debugPrint('string = $valorPonto');

      final valorDouble = double.parse(valorPonto);
      print('double = $valorDouble');

      var novo = Produto(id: 0,
          imagemPrincipal: imagem,
          isDiscontinued: false,
          name: nomeProduto,
          packageName: nomePacote,
          supplierId: int.parse(idFornecedor),
          unitPrice: valorDouble);

      ProdutoService().postProduto(novo);

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