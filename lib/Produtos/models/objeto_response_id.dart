
import 'conteudo_response.dart';

class ObjetoRetornoById {
  final Produto objetoRetorno;


  ObjetoRetornoById({
    required this.objetoRetorno,

    //this.supplier,
  });

  factory ObjetoRetornoById.fromJson(Map<String, dynamic> json){
      return ObjetoRetornoById(
          objetoRetorno: Produto.fromJson(json['objetoRetorno']));
}

}

