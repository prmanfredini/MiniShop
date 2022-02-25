import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/widgets/detalhes_card.dart';
import 'package:flutter_pr/Pedidos/widgets/detalhes_header.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';


class DetalhesPedido extends StatelessWidget {
  Pedido pedido;
  DetalhesPedido(this.pedido);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Detalhes do Pedido';


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
              HeaderDetalhes(pedido),
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
