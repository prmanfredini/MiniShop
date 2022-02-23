import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/views/produtos_add.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/views/produtos_card.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';

class ProdutosView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Produtos';

  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    produtos.add(Produto(
      id: 0,
      imagemPrincipal: 'urlLink',
      isDiscontinued: false,
      name: 'Nome Produto',
      packageName: '10 caixas x garrafas',
      supplier: Suplier(id: 1, city: 'sp', companyName: 'wallmart', phone: '99999999',),
      unitPrice: 10,));
   produtos.add(Produto(
      id: 0,
      imagemPrincipal: 'urlLink',
      isDiscontinued: false,
      name: 'Nome Produto',
      packageName: '10 caixas x garrafas',
      supplier: Suplier(id: 1, city: 'sp', companyName: 'wallmart', phone: '99999999',),
      unitPrice: 10,));



    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBarBuilder(label,_scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: (MediaQuery.of(context).size.height)- 181,
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
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
                    }),
              ),
            ),
          ],
        ),
      ),
            floatingActionButton: FloatingActionButton.small(
                tooltip: 'Cadastrar',
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddProduto()));
                },
                child: Icon(Icons.add))
    );
  }
}
