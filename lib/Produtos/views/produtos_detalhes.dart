import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/home.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/models/objeto_response_id.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto_response.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';

import '../widgets/produtos_card.dart';

class DetalheProduto extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int produtoId;

  DetalheProduto(this.produtoId);

  ProdutosBloc prodBloc = ProdutosBloc();

  var label = 'Detalhes do produto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: prodBloc.getProdutosById(produtoId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ObjetoRetornoById? objetoRetorno = snapshot.data;
            Produto? produto = objetoRetorno?.objetoRetorno;
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.waiting:
                  return ProgressBar();
                case ConnectionState.done:
                  return detalhes_card(produto!);
              }
            }
            return CenteredMessage('não há produtos');
            ;
          },
        ),
      ),
    );
  }

  GridView detalhes_card(Produto produto) {
    return GridView.builder(
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
                  'R\$ ${produto.unitPrice.toStringAsFixed(2)}',
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
                            style: TextStyle(
                                color: prodBloc.getColor(produto),
                                fontSize: 80),
                          ),
                          Text(
                            prodBloc.getAtivo(produto),
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
        });
  }
}
