
import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/objeto_response.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';

class PedidoService {
  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api/orders";

  Future<Objeto> getPedidos(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return Objeto.fromJson(res);
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
