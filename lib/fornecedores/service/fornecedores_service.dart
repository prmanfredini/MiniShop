import 'package:dio/dio.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import '../models/fornecedor.dart';

class fornecedoresService {
  final String baseURL = "local/api";

  Future<String> cadastrarCliente(FornecedorModel fornecedor) async {
    Response novoFornecedor = await Dio().post('$baseURL/eventos', data: fornecedor.toJson() );
    print(novoFornecedor);
    return novoFornecedor.statusMessage.toString();

  }

}
