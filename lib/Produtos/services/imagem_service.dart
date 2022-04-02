import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/imagem.dart';

class ImagemService {
    //criar novo link de mock no apiary com os responses do json para teste
  final String baseURL =
      "https://private-b79b2-minishop.apiary-mock.com/api/images/";

  Future<List<Imagem>> getImagem(int id) async {
    Response response = await Dio().get('$baseURL/{productId}?productId=$id');
    List<dynamic> res = response.data['objetoRetorno'];
    return res.map((dynamic json) => Imagem.fromJson(json)).toList();
  }

  Future<String> putImage(int seq, int id) async {
    Response response = await Dio().put('$baseURL/$id?sequencia=$seq');

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else {
      throw "Imagem não enviada.";
    }
  }

  Future<String> postImagem(FormData formData, int id) async {
    Response response = await Dio().post("$baseURL/upload/$id", data: formData);

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else {
      throw "Imagem não enviada.";
    }
  }
}
