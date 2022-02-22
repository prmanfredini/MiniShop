import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/views/produtos_view.dart';
import 'package:flutter_pr/clientes/views/cliente_view.dart';

Container DrawerBuilder(BuildContext context) {
  return Container(
    width: 140,
    child: Drawer(
      backgroundColor: Colors.purple[300],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 155,
            child: const DrawerHeader(
              padding: EdgeInsets.all(32),
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
          ),
          ListTile(
            title: Text('Produtos'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => ProdutosView()));
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
  );
}