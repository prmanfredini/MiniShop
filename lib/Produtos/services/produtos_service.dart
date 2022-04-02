import 'package:dio/dio.dart';
import 'package:flutter_pr/Produtos/models/objeto_response_id.dart';
import 'package:flutter_pr/Produtos/models/produto_response.dart';
import 'package:flutter_pr/Produtos/models/produto_request.dart';

class ProdutoService {
    //criar novo link de mock no apiary com os responses do json para teste
  final String baseURL =
      "https://private-b79b2-minishop.apiary-mock.com/api/products";

  Future<ObjetoRetorno> getProduto(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return ObjetoRetorno.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<ObjetoRetornoById> getProdutoById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data;

    if (response.statusCode == 200) {
      return ObjetoRetornoById.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<String> postProduto(ProdutoRequest produto) async {
    Response novoProduto =
        await Dio().post('$baseURL/create', data: produto.toJson());

    if (novoProduto.statusCode == 200) {
      return 'Produto cadastrado com Sucesso!';
    } else {
      return 'Não foi possível completar a requisiçao.\nCode Error: '
          '${novoProduto.statusCode} - ${novoProduto.statusMessage}';
    }
  }

  Future<String> putProduto(ProdutoRequest produto, int id) async {
    Response novoProduto =
        await Dio().put('$baseURL/$id', data: produto.toJson());

    if (novoProduto.statusCode == 200) {
      return 'Produto alterado com Sucesso!';
    } else {
      return 'Não foi possível completar a requisiçao.\nCode Error: '
          '${novoProduto.statusCode} - ${novoProduto.statusMessage}';
    }
  }
}
