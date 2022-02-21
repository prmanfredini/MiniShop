
import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/clientes/views/client.dart';


class ClienteView extends StatefulWidget {
  String? dropdownValue;

  @override
  State<ClienteView> createState() => _HomeState();
}

class _HomeState extends State<ClienteView> with SingleTickerProviderStateMixin {

  var label = 'Pesquisar Clientes';


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarBuilder(),
      drawer: Drawer(
        backgroundColor: Colors.purple[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('Produtos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Clientes'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => ClienteView()));
              },
            ),
            ListTile(
              title: Text('Fornecedores'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pedidos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardClientes(),
      ),
    );
  }


}
