import 'package:dio/dio.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/models/objeto_cliente.dart';
import '../models/cliente.dart';

class ClienteService {
  
    //criar novo link de mock no apiary com os responses do json para teste
  final String baseURL =
      "https://private-b79b2-minishop.apiary-mock.com/api/customers";

  Future<ObjetoCliente> getClientes(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return ObjetoCliente.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<String> editarClientes(ClienteModel cliente) async {
    Response editarCliente =
        await Dio().put('$baseURL/${cliente.id}', data: cliente.toJson());
    if (editarCliente.statusCode == 200) {
      return 'Alterado com Sucesso!';
    } else {
      return 'Não foi possível alterar o cliente.\nCode Error: '
          '${editarCliente.statusCode} - ${editarCliente.statusMessage}';
    }
  }

  Future<String> cadastrarCliente(ClienteModel cliente) async {
    Response novoCliente = await Dio().post(baseURL, data: cliente.toJson());
    if (novoCliente.statusCode == 200) {
      return 'Cadastrado com Sucesso!';
    } else {
      return 'Não foi possível cadastrar o cliente.\nCode Error: '
          '${novoCliente.statusCode} - ${novoCliente.statusMessage}';
    }
  }
}
