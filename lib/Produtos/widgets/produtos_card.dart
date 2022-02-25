import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/views/produtos_detalhes.dart';

class CardProdutos extends StatelessWidget {
  Produto produto;

  CardProdutos(this.produto);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            child: InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => DetalheProduto(produto.id)));
            },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      produto.name,
                      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 40.0, bottom: 40),
                      child: Text('imagem'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'R\$ ${produto.unitPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(produto.packageName,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
