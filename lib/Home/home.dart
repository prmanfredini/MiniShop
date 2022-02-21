
import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/Home/widgets/bottombar.dart';


class Home extends StatefulWidget {
  String? dropdownValue;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final _pesquisa = TextEditingController();
  var label = 'Pesquisar Clientes';

  var f = (context) => FloatingActionButton(
    tooltip: 'Nova transação',
    child: Icon(Icons.add),
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    },
  );

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              f = (context) => FloatingActionButton(
                tooltip: 'Novo Cliente',
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              );
              setState(() {
                label = 'Pesquisar Clientes';
              });
              break;
            case 1:
              f = (context) => FloatingActionButton(
                backgroundColor: Colors.blue,
                tooltip: 'Nova Produto',
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              );
              setState(() {
                label = 'Pesquisar Produtos';
              });
              break;
            case 2:
              f = (context) => FloatingActionButton(
                backgroundColor: Colors.purple,
                tooltip: 'Nova Fornecedor',
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              );
              setState(() {
                label = 'Pesquisar Fornecedores';
              });
              break;
            case 3:
              f = (context) => FloatingActionButton(
                backgroundColor: Colors.green,
                tooltip: 'Nova Venda',
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              );
              setState(() {
                label = 'Pesquisar Vendas';
              });
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarBuilder(tabController),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: TabBarView(controller: tabController, children: [
          ListView(
            padding: const EdgeInsets.all(24),
            children: const [
              Card(child: Text('Clientes'),),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(24),
            children: const [
              Card(child: Text('Produtos'),),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(24),
            children: const [
              Card(child: Text('Fornecedores'),),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(24),
            children: const [
              Card(child: Text('Vendas'),)
            ],
          ),

        ]),
      ),
      floatingActionButton: f(context),
      bottomNavigationBar: BottomBar(_pesquisa, label),
    );
  }


}
