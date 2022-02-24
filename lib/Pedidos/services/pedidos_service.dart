import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';

class PedidoService {
  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api/orders";

  Future<List<Pedido>> getPedidos(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    List<dynamic> res = response.data['objetoRetorno']['content'];
    print('res = $res'); // chega até aqui

    final List<dynamic> decodedJson = jsonDecode(response.data['objetoRetorno']['content']);
    print(decodedJson);

    if (response.statusCode == 200) {
      return res.map((json) => Pedido.fromJson(json)).toList();
    } else {
      throw "Server Error";
    }
  }

  Future<Pedido> getPedidoById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data;

    if (response.statusCode == 200) {
    return Pedido.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<String> postPedido(PedidoRequest pedido) async {
    Response novoPedido = await Dio().post(baseURL, data: pedido.toJson());

    return novoPedido.statusMessage.toString();

  }

}
