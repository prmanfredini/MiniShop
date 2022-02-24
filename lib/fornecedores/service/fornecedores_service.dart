import 'package:dio/dio.dart';
import '../models/fornecedor.dart';

class FornecedorService{

  final String baseURL = "http://lb-0-1388852470.sa-east-1.elb.amazonaws.com/api/";

  Future<List<FornecedorModel>> getFornecedores() async {
    Response response = await Dio().get('$baseURL/suppliers?index=0&qtd=50');
    List<dynamic> res = response.data['objetoRetorno']['content'] ?? [];
    print(res.toString());
    return res.map((dynamic json) => FornecedorModel.fromJson(json)).toList();
  }

  Future<String> cadastrarFornecedor(FornecedorModel fornecedor) async {
    Response novoFornecedor = await Dio().post('$baseURL/suppliers', data: fornecedor.toJson() );
    print(novoFornecedor);
    return novoFornecedor.statusMessage.toString();

  }

  Future<String> editarFornecedor(FornecedorModel fornecedor) async {
    Response editarFornecedor = await Dio().put('$baseURL/suppliers/${fornecedor.id}', data: fornecedor.toJson() );
    print(editarFornecedor);
    return editarFornecedor.statusMessage.toString();

  }

}
