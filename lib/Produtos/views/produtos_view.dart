import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/views/produtos_add.dart';
import 'package:flutter_pr/Produtos/widgets/produtos_card.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProdutosView extends StatefulWidget {
  @override
  State<ProdutosView> createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Produtos';
  ProdutosBloc produtosBloc = ProdutosBloc();
  final PagingController<int, Produto> pagingController =
      PagingController(firstPageKey: 0);


  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      produtosBloc.getProdutos(pageKey);
    });
    produtosBloc.streamPagingState.listen((event) {
      pagingController.value = event;
    });
  }

  @override
  void dispose() {
    produtosBloc.dispose();
    pagingController.dispose();
    super.dispose();
  }

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
                  child: PagedGridView(
                    pagingController: pagingController,
                    builderDelegate:
                    PagedChildBuilderDelegate<Produto>(
                      itemBuilder: (context, item, index) {
                        return CardProdutos(item);
                      },
                    ),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: 4 / 6.0,
                    ),
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
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
