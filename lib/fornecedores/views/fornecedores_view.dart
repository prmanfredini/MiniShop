import 'package:flutter/material.dart';

import 'package:flutter_pr/clientes/views/cliente_cadastro.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/fornecedores/views/fornecedores_cadastro.dart';

import 'fornecedores.dart';

class FornecedorView extends StatefulWidget {
  String? dropdownValue;

  @override
  State<FornecedorView> createState() => _HomeState();
}

class _HomeState extends State<FornecedorView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  var label = 'Fornecedores';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: AppBarBuilder(label, _key),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardFornecedores(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
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
