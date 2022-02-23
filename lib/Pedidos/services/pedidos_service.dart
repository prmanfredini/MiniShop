import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';

class PedidoService {
  final String baseURL = "https://localhost:8080/api/orders";

  Future<List<Pedido>> getPedidos() async {
    Response response = await Dio().get(baseURL);
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    return res.map((dynamic json) => Pedido.fromJson(json)).toList();
  }

  Future<Pedido> getPedidoById(int idPedido) async {
    Response response = await Dio().get('$baseURL/$idPedido');
    var res = response.data;
    return Pedido.fromJson(res);
  }

  Future<String> postPedido(Pedido pedido) async {
    Response novoPedido = await Dio().post(baseURL, data: pedido.toJson());
    return novoPedido.statusMessage.toString();

  }

}
