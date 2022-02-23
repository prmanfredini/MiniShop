import 'package:dio/dio.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';

class ProdutoService {
  final String baseURL = "https://private-b79b27-minishop2.apiary-mock.com/api/products";

  Future<List<Produto>> getProduto() async {
    Response response = await Dio().get(baseURL);
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    return res.map((dynamic json) => Produto.fromJson(json)).toList();
  }

  Future<Produto> getProdutoById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data;
    return Produto.fromJson(res);
  }

  Future<String> postProduto(Produto produto) async {
    print(produto.toJson());
    Response novoProduto = await Dio().post('$baseURL/create', data: produto.toJson());
    print(novoProduto.data.toString());
    return novoProduto.statusMessage.toString();

  }

}
