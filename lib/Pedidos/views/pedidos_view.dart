import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/bloc/pedidos_bloc.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_add.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Pedidos/models/pedido_response.dart';
import 'package:flutter_pr/Pedidos/widgets/pedidos_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PedidosView extends StatefulWidget {
  const PedidosView({Key? key}) : super(key: key);

  @override
  State<PedidosView> createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final label = 'Pedidos';

  PedidosBloc pedidosBloc = PedidosBloc();
  final PagingController<int, Pedido> pedidosController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    pedidosController.addPageRequestListener((pageKey) {
      pedidosBloc.getPedidos(pageKey);
    });
    pedidosBloc.streamPagingState.listen((event) {
      pedidosController.value = event;
    });
  }

  @override
  void dispose() {
    pedidosBloc.dispose();
    pedidosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: appBarBuilder(label, _scaffoldKey),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) - 181,
                  child: PagedGridView(
                    pagingController: pedidosController,
                    builderDelegate: PagedChildBuilderDelegate<Pedido>(
                      itemBuilder: (context, item, index) {
                        return CardPedidos(item);
                      },
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2 / 1.1,
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
                    builder: (BuildContext context) => AddPedido()));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
