import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import '../models/cliente.dart';

class ClienteService {
  final String baseURL = "https://private-7be2f1-rafaelhideolopeskikuchi.apiary-mock.com/api";

  Future<List<ClienteModel>> getClientes() async {
    Response response = await Dio().get('$baseURL/Customers');
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    return res.map((dynamic json) => ClienteModel.fromJson(json)).toList();
  }

  Future<ClienteModel> putClientesById(ClienteModel cliente) async {
    Response response = await Dio().put('$baseURL/Customers/customer_id');
    var res = response.data['conteudo'];
    debugPrint(res.toString());
    return ClienteModel.fromJson(res);
  }

  Future<String> cadastrarCliente(ClienteModel cliente) async {
    Response novoCliente = await Dio().post('$baseURL', data: cliente.toJson());
    print(novoCliente);
    return novoCliente.statusMessage.toString();

  }

}
