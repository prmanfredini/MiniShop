import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/fornecedores/bloc/fornecedor_bloc.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/views/fornecedores_cadastro.dart';
import 'package:flutter_pr/fornecedores/widgets/card_fornecedores.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FornecedorView extends StatefulWidget {
  const FornecedorView({Key? key}) : super(key: key);

  @override
  State<FornecedorView> createState() => _FornecedorViewState();
}

class _FornecedorViewState extends State<FornecedorView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final label = 'Fornecedores';

  final fornecedorBloc = FornecedorBloc();
  final PagingController<int, Fornecedor> fornecedorController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    fornecedorController.addPageRequestListener((pageKey) {
      fornecedorBloc.getFornecedores(pageKey);
    });
    fornecedorBloc.streamPagingState.listen((event) {
      fornecedorController.value = event;
    });
  }

  @override
  void dispose() {
    fornecedorBloc.dispose();
    fornecedorController.dispose();
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
                  pagingController: fornecedorController,
                  builderDelegate: PagedChildBuilderDelegate<Fornecedor>(
                    itemBuilder: (context, item, index) {
                      return CardFornecedor(item);
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.65,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        tooltip: 'Cadastrar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => FornecedoresCadastro(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
