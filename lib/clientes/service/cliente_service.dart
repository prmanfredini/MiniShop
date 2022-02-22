import 'package:dio/dio.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import '../models/cliente.dart';

class clienteService {
  final String baseURL = "local/api";

  Future<String> cadastrarCliente(ClienteModel cliente) async {
    Response novoCliente = await Dio().post('$baseURL/eventos', data: cliente.toJson() );
    print(novoCliente);
    return novoCliente.statusMessage.toString();

  }

}
