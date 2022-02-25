import 'package:dio/dio.dart';
import '../models/fornecedor.dart';

class FornecedorService{

  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api/";

  Future<List<FornecedorModel>> getFornecedores() async {
    Response response = await Dio().get('$baseURL/suppliers?index=0&qtd=50');
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    return res.map((dynamic json) => FornecedorModel.fromJson(json)).toList();
  }

  Future<String> cadastrarFornecedor(FornecedorModel fornecedor) async {
    Response novoFornecedor = await Dio().post('$baseURL/suppliers', data: fornecedor.toJson() );
    if(novoFornecedor.statusCode == 200){
      return 'Cadastrado com Sucesso!';}
    else {
      return 'Não foi possível cadastrar o fornecedor.\nCode Error: ${novoFornecedor.statusCode} - ${novoFornecedor.statusMessage}';
    }

  }

  Future<String> editarFornecedor(FornecedorModel fornecedor) async {
    Response editarFornecedor = await Dio().put('$baseURL/suppliers/${fornecedor.id}', data: fornecedor.toJson() );
    if(editarFornecedor.statusCode == 200){
      return 'Alterado com Sucesso!';}
    else {
      return 'Não foi possível alterar o fornecedor.\nCode Error: ${editarFornecedor.statusCode} - ${editarFornecedor.statusMessage}';
    }
  }

}
