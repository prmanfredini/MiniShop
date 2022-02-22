class ProductImage {
  //final double id;
  //final double seqExibicao;
  final String path;

  ProductImage(
      // this.id,
      // this.seqExibicao,
      this.path);

  ProductImage.fromJson(Map<String, dynamic> json)
      : //id = json["id"],
  //seqExibicao = json["seqExibicao"],
        path = json["path"];

  Map<String, dynamic> toJson() => {""
  // "id": id,
  // "seqExibicao": seqExibicao,
      "path": path};
}