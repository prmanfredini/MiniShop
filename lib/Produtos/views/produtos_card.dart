import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/views/produtos_detalhes.dart';

class CardProdutos extends StatelessWidget {
  Produto? produto;

  CardProdutos(this.produto);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Visibility(
            visible: produto != null,
            child: Material(
              child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalheProduto()));
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        produto?.name ?? 'nome',
                        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                        'R\$: ${produto?.unitPrice.toString()}',
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Text(produto?.packageName ?? 'embalagem',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
              visible: produto == null,
              child: const Card(
                child: Text('Não há produtos cadastrados'),
              )),
        ],
      ),
    );
  }
}
