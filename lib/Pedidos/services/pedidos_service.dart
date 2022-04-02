import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/objeto_response.dart';
import 'package:flutter_pr/Pedidos/models/pedido_request.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response_by_id.dart';

class PedidoService {
    //criar novo link de mock no apiary com os responses do json para teste
  final String baseURL =
      "https://private-b79b2-minishop.apiary-mock.com/api/orders";

  Future<Objeto> getPedidos(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return Objeto.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<PedidoById> getPedidosById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return PedidoById.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<String> postPedido(PedidoRequest pedido) async {
    Response novoPedido = await Dio().post(baseURL, data: pedido.toJson());

    if (novoPedido.statusCode == 200) {
      return 'Pedido cadastrado com Sucesso!';
    } else {
      return 'Não foi possível completar a requisiçao.\nCode Error:'
          ' ${novoPedido.statusCode} - ${novoPedido.statusMessage}';
    }
  }
}
