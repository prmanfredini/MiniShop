import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/home.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_view.dart';
import 'package:flutter_pr/Produtos/views/produtos_view.dart';
import 'package:flutter_pr/clientes/views/cliente_view.dart';
import 'package:flutter_pr/fornecedores/views/fornecedores_view.dart';

Container DrawerBuilder(BuildContext context) {
  return Container(
    width: 140,
    child: Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 155,
            child: DrawerHeader(
              padding: EdgeInsets.all(32),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => Home()));
            },
          ),
          ListTile(
            title: Text('Produtos', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => ProdutosView()));
            },
          ),
          ListTile(
            title: Text('Clientes', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => ClienteView()));
            },
          ),
          ListTile(
            title: Text('Fornecedores', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => FornecedorView()));
            },
          ),
          ListTile(
            title: Text('Pedidos', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => PedidosView()));
            },
          ),
        ],
      ),
    ),
  );
}