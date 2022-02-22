
import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/Home/widgets/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/produtos_card.dart';


class ProdutosView extends StatelessWidget {

  var label = 'Produtos';

  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
    produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
    produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
    produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));
    produtos.add(Produto(
        id: 0,
        productName: 'Nome Produto',
        supplieId: 1,
        unitPrice: 10,
        packageName: '10 Caixas x 20 garrafas'));


    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBarBuilder(label),
      drawer: DrawerBuilder(context),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: (MediaQuery.of(context).size.height)- 238,
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
            Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    tooltip: 'Cadastrar',
                    backgroundColor: Colors.purple,
                    onPressed: () {
                      //savo com sucesso
                    },
                    child: Icon(Icons.add)))
          ],
        ),
      ),
    );
  }
}
