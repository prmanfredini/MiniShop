import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/home.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';

import 'produtos_card.dart';

class DetalheProduto extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Produto produto = Produto(
    id: 0,
    imagemPrincipal: 'urlLink',
    isDiscontinued: false,
    name: 'Nome Produto',
    packageName: '10 caixas x 4 garrafas',
    supplierId: 1,
    supplier: Suplier(
      id: 1,
      city: 'sp',
      companyName: 'wallmart',
      phone: '99999999',
    ),
    unitPrice: 10,
  );

  // var ativo = 'Inativo';
  // var cor = Colors.grey;

  var ativo = 'Ativo';
  var cor = Colors.green;

  var label = 'Detalhes do produto';

  @override
  Widget build(BuildContext context) {
    if (produto.isDiscontinued) {
      ativo = 'Ativo';
      cor = Colors.green;
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            produto.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          height: 150,
                          width: 100,
                          child: Text('imagem'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      'R\$: ${produto.unitPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fornecedor: ${produto.supplier?.companyName ?? 'nome'}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            'Pacote: ${produto.packageName}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Row(
                            children: [
                              Text(
                                '•',
                                style: TextStyle(color: cor, fontSize: 80),
                              ),
                              Text(
                                '${ativo}',
                                style: TextStyle(fontSize: 24.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditaProduto(
                                            produto: produto,
                                          )));
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
