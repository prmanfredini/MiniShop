import 'package:dio/dio.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';

class ProdutoService {
  final String baseURL = "https://localhost:8080/api/orders";

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
    Response novoProduto = await Dio().post(baseURL, data: produto.toJson());
    return novoProduto.statusMessage.toString();

  }

}
