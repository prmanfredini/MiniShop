class Imagem {
  final int? id;
  final String path;
  final int productId;
  final int? seqExibicao;

  Imagem({
    this.id,
    required this.path,
    required this.productId,
    this.seqExibicao,
  });


  factory Imagem.fromJson(dynamic json) {
    return Imagem(
        id : json['id'],
        path : json['path'],
        productId : json['productId'],
        seqExibicao : json['seqExibicao']);
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'productId': productId,
    'seqExibicao': seqExibicao,
  };
}