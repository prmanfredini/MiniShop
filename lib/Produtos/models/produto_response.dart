
import 'conteudo_response.dart';

class ObjetoRetorno {
  final List<Produto> conteudo;
  final int totalPages;
  ObjetoRetorno({
    required this.conteudo,
    required this.totalPages,
    //this.supplier,
  });

  factory ObjetoRetorno.fromJson(Map<String, dynamic> json){
    List<dynamic> prod = json['content'];
      return ObjetoRetorno(
          conteudo: prod.map((dynamic jsons) => Produto.fromJson(jsons)).toList(),
          totalPages : json['totalPages']);
}

}

