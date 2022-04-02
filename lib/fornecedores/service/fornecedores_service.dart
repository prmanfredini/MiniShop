import 'package:dio/dio.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor_resquest.dart';
import 'package:flutter_pr/fornecedores/models/objeto_fornecedor.dart';
import '../models/fornecedor.dart';

class FornecedorService {

  //criar novo link de mock no apiary com os responses do json para teste
  final String baseURL =
      "https://private-b79b2-minishop.apiary-mock.com/api/suppliers";

  Future<ObjetoFornecedor> getFornecedores(int index, int qtd) async {
    Response response = await Dio().get('$baseURL?index=$index&qtd=$qtd');
    var res = response.data['objetoRetorno'];

    if (response.statusCode == 200) {
      return ObjetoFornecedor.fromJson(res);
    } else {
      throw "Server Error";
    }
  }

  Future<String> cadastrarFornecedor(FornecedorRequest fornecedor) async {
    Response novoFornecedor =
        await Dio().post(baseURL, data: fornecedor.toJson());

    if (novoFornecedor.statusCode == 200) {
      return 'Cadastrado com Sucesso!';
    } else {
      return 'Não foi possível cadastrar o fornecedor.\nCode Error:'
          ' ${novoFornecedor.statusCode} - ${novoFornecedor.statusMessage}';
    }
  }

  Future<String> editarFornecedor(FornecedorRequest fornecedor, int id) async {
    Response editarFornecedor =
        await Dio().put('$baseURL/$id', data: fornecedor.toJson());

    if (editarFornecedor.statusCode == 200) {
      return 'Alterado com Sucesso!';
    } else {
      return 'Não foi possível alterar o fornecedor.\nCode Error:'
          '${editarFornecedor.statusCode} - ${editarFornecedor.statusMessage}';
    }
  }
}
