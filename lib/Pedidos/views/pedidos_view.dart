import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/order.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_add.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_card.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';


class PedidosView extends StatelessWidget {

  var label = 'Pedidos';

  List<Pedido> pedidos = [];
  var produto = Produto(
    id: 0,
    name: 'Nome Produto',
    supplier: Suplier(city: 'sp', companyName: 'wallmart', phone: '99999999',),
    unitPrice: 10,);
  var cliente = ClienteModel(
      id: 1,
      firstName: 'Rafael',
      lastName: 'Kikuchi',
      city: 'Belém',
      country: 'Brasil',
      phone: '(91) 99999-9999');
  var ordem = Order(id: 1, productId: 1, quantity: 1, unitPrice: 10.0);

  @override
  Widget build(BuildContext context) {
    pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));
pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));
pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));
pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));
pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));
pedidos.add(Pedido(0, cliente, DateTime.now(), ordem, '1', 10));

    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBarBuilder(label),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height) - 181,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Data'),
                              Text('Nome'),
                              Text('Valor'),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: pedidos.length,
                          itemBuilder: (context, index) {
                            return CardPedidos(pedidos[index]);
                          }),
                    ],
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
              Navigator.push(context,MaterialPageRoute(
                  builder: (BuildContext context) => AddPedido()));
            },
            child: Icon(Icons.add))
    );
  }
}
