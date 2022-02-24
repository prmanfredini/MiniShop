
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/produto_request.dart';

class ProdutoService {
  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api/products";

  Future<List<Produto>> getProduto(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    List<dynamic> res = response.data['objetoRetorno']['content'];
    print('res = $res'); //até aqui vem


    //Iterable<Produto> realdata = List<Produto>.from(res).map((x) => Produto.fromJson(x));

    if (response.statusCode == 200) {
      return res.map((dynamic json) => Produto.fromJson(json)).toList();
    } else {
      throw "Server Error";
    }
  }

  Future<Produto> getProdutoById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data;
    return Produto.fromJson(res);
  }

  Future<String> postProduto(ProdutoRequest produto) async {
    print(produto.toJson());
    Response novoProduto = await Dio().post('$baseURL/create', data: produto.toJson());
    print(novoProduto.data.toString());

    return novoProduto.statusMessage.toString();

  }

  Future<String> putProduto(ProdutoRequest produto, int id) async {
    print(produto.toJson());
    Response novoProduto = await Dio().put('$baseURL/$id', data: produto.toJson());
    print(novoProduto.data.toString());

    return novoProduto.statusMessage.toString();

  }

}
