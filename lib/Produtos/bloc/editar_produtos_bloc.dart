import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/models/produto_request.dart';

class EditarProdutosBloc extends ProdutosBloc {
  late Produto produto;

  @override
  void salvarProduto(
      String unitPrice,
      bool ativo,
      String nome,
      String nomePacote,
      String supplierId,
      String imagem,
      GlobalKey<FormState> key,
      BuildContext context) {
    if (key.currentState!.validate()) {
      var aux = unitPrice.split(' ');
      var valorPonto = aux[1].split(',').join('.');

      var novo = ProdutoRequest(
          isDiscontinued: ativo,
          name: nome,
          packageName: nomePacote,
          supplierId: int.parse(supplierId),
          unitPrice: double.parse(valorPonto));

      produtoService
          .putProduto(novo, produto.id)
          .then((value) => onComplete(context, value));
    }
  }

}
