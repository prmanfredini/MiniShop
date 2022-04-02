import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/bloc/pedidos_bloc.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response_by_id.dart';
import 'package:flutter_pr/Pedidos/widgets/detalhes_card.dart';
import 'package:flutter_pr/Pedidos/widgets/detalhes_header.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';


class DetalhesPedido extends StatelessWidget {
  int pedidoId;
  DetalhesPedido(this.pedidoId, {Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final label = 'Detalhes do Pedido';
  PedidosBloc pedidosBloc = PedidosBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: appBarBuilder(label, _scaffoldKey),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: FutureBuilder(
            future: pedidosBloc.getPedidosById(pedidoId),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              PedidoById? pedido = snapshot.data;
              if (snapshot.hasData) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.active:
                    break;
                  case ConnectionState.waiting:
                    return const ProgressBar();
                  case ConnectionState.done:
                    return Column(
                      children: [
                        HeaderDetalhes(pedido),
                        SingleChildScrollView(
                          child: CardDetalhes(pedido),
                        ),
                      ],
                    );
                }
              }
              return const CenteredMessage('não há produtos');
            },
          ),
        ),
    );
  }
}


