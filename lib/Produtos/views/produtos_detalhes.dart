import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/home.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';

import 'produtos_card.dart';


class DetalheProduto extends StatelessWidget {
  Produto produto = Produto(
    id: 0,
    name: 'Nome Produto',
    supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
    unitPrice: 10,);

  var label = 'Detalhes do produto';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBody: true,
      appBar: AppBarBuilder(label),
      drawer: DrawerBuilder(context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 6.5,
            ),
            physics: const ScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.blue,
                              height: 90,
                              width: 60,
                              child: Text('imagem'),
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Container(
                              color: Colors.blue,
                              height: 90,
                              width: 60,
                              child: Text('imagem'),
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Container(
                              color: Colors.blue,
                              height: 90,
                              width: 60,
                              child: Text('imagem'),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          color: Colors.blue,
                          height: 300,
                          width: 200,
                          child: Text('imagem'),
                        )
                      ],
                    ),
                    Text(
                      'R\$: ${produto.unitPrice.toString()}',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    Text(
                      produto.name,
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => EditaProduto(produto: produto,)));
                            },
                            iconSize: 32,
                            icon: Icon(Icons.edit)))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
