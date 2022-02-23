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
        id : json['id'] as int,
        path : json['path'],
        productId : json['productId'] as int,
        seqExibicao : json['seqExibicao'] as int);
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'productId': productId,
    'seqExibicao': seqExibicao,
  };
}