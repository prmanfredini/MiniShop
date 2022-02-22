
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';
import 'package:flutter_pr/Produtos/views/produtos_card.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';


class ProdutosView extends StatelessWidget {

  var label = 'Produtos';

  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));
    produtos.add(Produto(
        id: 0,
        name: 'Nome Produto',
        supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
        unitPrice: 10,));



    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBarBuilder(label),
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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 6.5,
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
                backgroundColor: Colors.purple,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditaProduto(produto: null,)));
                },
                child: Icon(Icons.add))
    );
  }
}
