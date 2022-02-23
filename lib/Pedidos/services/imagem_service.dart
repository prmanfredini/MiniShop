import 'package:dio/dio.dart';
import 'package:flutter_pr/Pedidos/models/imagem.dart';

class ImagemService {
  final String baseURL = "https://localhost:8080/api/images";

  Future<List<Imagem>> getImagem(int id) async {
    Response response = await Dio().get('$baseURL/{productId}?productId=$id');
    List<dynamic> res = response.data['objetoRetorno'] ?? [];
    return res.map((dynamic json) => Imagem.fromJson(json)).toList();
  }

  Future<String> postProduto(String path, int id) async {
    Response novaImagem = await Dio().post('$baseURL/upload/$id',
        data: Imagem(path: path, productId: id).toJson());
    return novaImagem.statusMessage.toString();
  }

  Future<String> putImage(int sequencia, int id) async {
    Response response = await Dio().get('$baseURL/{productId}?productId=$id');
    var path = response.data['objetoRetorno']['$id']['path']; // ?? arrumar isso
    Response novaImagem = await Dio().put(
        '$baseURL/upload/$id?sequencia=$sequencia',
        data:
            Imagem(path: path, productId: id, seqExibicao: sequencia).toJson());
    return novaImagem.statusMessage.toString();
  }
}
