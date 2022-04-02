import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/bloc/clientes_bloc.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/widgets/card_clientes.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/clientes/views/cliente_cadastro.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClienteView extends StatefulWidget {
  const ClienteView({Key? key}) : super(key: key);

  @override
  State<ClienteView> createState() => _ClienteViewState();
}

class _ClienteViewState extends State<ClienteView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final label = 'Clientes';

  ClienteBloc clienteBloc = ClienteBloc();
  final PagingController<int, ClienteModel> clientesController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    clientesController.addPageRequestListener((pageKey) {
      clienteBloc.getClientes(pageKey);
    });
    clienteBloc.streamPagingState.listen((event) {
      clientesController.value = event;
    });
  }

  @override
  void dispose() {
    clienteBloc.dispose();
    clientesController.dispose();
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
        child: SingleChildScrollView(
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 181,
            child: PagedGridView(
              pagingController: clientesController,
              builderDelegate: PagedChildBuilderDelegate<ClienteModel>(
                itemBuilder: (context, item, index) {
                  return CardCliente(item);
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.3,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        tooltip: 'Cadastrar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ClienteCadastro(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
