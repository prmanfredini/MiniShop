import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/bloc/pedidos_bloc.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_add.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';
import 'package:flutter_pr/Pedidos/widgets/pedidos_card.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';

class PedidosView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Pedidos';

  PedidosBloc pedidosBloc = PedidosBloc();

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
                  child: FutureBuilder(
                    future: pedidosBloc.getPedidos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      List<Pedido> pedidos = snapshot.data ?? [];
                      if (snapshot.hasData) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return CenteredMessage('não há pedidos');
                          case ConnectionState.active:
                            return ProgressBar();
                          case ConnectionState.waiting:
                            return ProgressBar();
                          case ConnectionState.done:
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: pedidos.length,
                                itemBuilder: (context, index) {
                                  return CardPedidos(pedidos[index]);
                                });
                        }
                      }
                      return ProgressBar();
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
                    builder: (BuildContext context) => AddPedido()));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
