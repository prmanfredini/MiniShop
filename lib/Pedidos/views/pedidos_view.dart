
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_card.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';


class PedidosView extends StatelessWidget {

  var label = 'Pedidos';

  List<Pedido> pedidos = [];

  @override
  Widget build(BuildContext context) {
    pedidos.add(Pedido(0, 'Nome Sobrenome', DateTime.now(),
        Produto(
          id: 0,
          name: 'Nome Produto',
          supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999', ),
          unitPrice: 10,),
        '1', 2));

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
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: pedidos.length,
                      itemBuilder: (context, index) {
                        return CardPedidos(pedidos[index]);
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

            },
            child: Icon(Icons.add))
    );
  }
}
