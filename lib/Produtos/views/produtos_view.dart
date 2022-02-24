import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/services/produtos_service.dart';
import 'package:flutter_pr/Produtos/views/produtos_add.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto_response.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/widgets/produtos_card.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';

class ProdutosView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Produtos';
  ProdutosBloc produtosBloc = ProdutosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: AppBarBuilder(label, _scaffoldKey),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: (MediaQuery.of(context).size.height) - 181,
                  padding: const EdgeInsets.all(24.0),
                  child: FutureBuilder<List<Produto>>(
                    future: produtosBloc.getProdutos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Produto>> snapshot) {
                      List<Produto> produtos = snapshot.data ?? [];
                          if (snapshot.hasData) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                break;
                              case ConnectionState.active:
                                break;
                              case ConnectionState.waiting:
                                return ProgressBar();
                              case ConnectionState.done:
                                return GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 24,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: 4 / 6.0,
                                    ),
                                    physics: const ScrollPhysics(),
                                    itemCount: produtos.length,
                                    itemBuilder: (context, index) {
                                      return CardProdutos(produtos[index]);
                                    });
                            }
                          }
                          return CenteredMessage('não há produtos');
                        },
                      ),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          tooltip: 'Cadastrar',
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddProduto()));
          },
          child: Icon(Icons.add, color: Colors.white),
        ));
  }
}
