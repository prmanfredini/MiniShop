import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/views/produtos_detalhes.dart';

class CardProdutos extends StatelessWidget {
  Produto produto;

  CardProdutos(this.produto);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70.0, bottom: 70),
              child: Text('imagem'),
            ),
            Text(
              'R\$: ${produto.unitPrice.toString()}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              produto.packageName,
              style: TextStyle(fontSize: 12.0),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DetalheProduto()));
                    },
                    icon: Icon(Icons.edit)))
          ],
        ),
      );
  }
}
