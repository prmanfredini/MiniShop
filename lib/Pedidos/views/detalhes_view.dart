import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/models/order.dart';
import 'package:flutter_pr/Pedidos/views/detalhes_card.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_add.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_card.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/Produtos/models/suplier.dart';


class DetalhesPedido extends StatelessWidget {
  Pedido pedido;
  DetalhesPedido(this.pedido);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Detalhes do Pedido';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[350],
        appBar: AppBarBuilder(label, _scaffoldKey),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: Column(
            children: [
              CardPedidos(pedido),
              SingleChildScrollView(
                child: Container(
                  child: CardDetalhes(pedido),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
