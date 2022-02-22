import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/Home/widgets/drawer_builder.dart';
import 'package:flutter_pr/clientes/views/client.dart';
import 'package:flutter_pr/clientes/views/cliente_cadastro.dart';

class ClienteView extends StatefulWidget {
  String? dropdownValue;

  @override
  State<ClienteView> createState() => _HomeState();
}

class _HomeState extends State<ClienteView> with SingleTickerProviderStateMixin {

  var label = 'Clientes';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: AppBarBuilder(label),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardClientes(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
            builder: (BuildContext context) => ClienteCadastro()));},
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
