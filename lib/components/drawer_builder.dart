import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/home.dart';
import 'package:flutter_pr/Pedidos/views/pedidos_view.dart';
import 'package:flutter_pr/Produtos/views/produtos_view.dart';
import 'package:flutter_pr/clientes/views/cliente_view.dart';
import 'package:flutter_pr/fornecedores/views/fornecedores_view.dart';

class DrawerBuilder extends StatelessWidget {
  final BuildContext context;

  const DrawerBuilder(this.context, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Drawer(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 155,
              child: DrawerHeader(
                padding: const EdgeInsets.all(32),
                child: const Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Home()));
              },
            ),
            ListTile(
              title: const Text(
                'Produtos',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProdutosView()));
              },
            ),
            ListTile(
              title: const Text(
                'Clientes',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                        builder: (
                            BuildContext context) => const ClienteView()));
              },
            ),
            ListTile(
              title: const Text(
                'Fornecedores',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const FornecedorView()));
              },
            ),
            ListTile(
              title: const Text(
                'Pedidos',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const PedidosView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}