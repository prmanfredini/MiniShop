import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import '../models/cliente.dart';

class ClienteService {
  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api";

  Future<List<ClienteModel>> getClientes() async {
    Response response = await Dio().get('$baseURL/customers?index=0&qtd=50');
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    return res.map((dynamic json) => ClienteModel.fromJson(json)).toList();
  }

  Future<String> editarClientes(ClienteModel cliente) async {
    Response editarCliente = await Dio().put('$baseURL/customers/${cliente.id}', data: cliente.toJson());
    if(editarCliente.statusCode == 200){
      return 'Alterado com Sucesso!';}
    else {
      return 'Não foi possível alterar o cliente.\nCode Error: ${editarCliente.statusCode} - ${editarCliente.statusMessage}';
    }
  }

  Future<String> cadastrarCliente(ClienteModel cliente) async {
    Response novoCliente = await Dio().post('$baseURL/customers', data: cliente.toJson());
    if(novoCliente.statusCode == 200){
      return 'Cadastrado com Sucesso!';}
    else {
      return 'Não foi possível cadastrar o cliente.\nCode Error: ${novoCliente.statusCode} - ${novoCliente.statusMessage}';
    };

  }

}
