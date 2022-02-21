import 'package:flutter/material.dart';

AppBarBuilder(TabController tabController) {
  return AppBar(
    title: Text('MiniShop', style: TextStyle(fontSize: 22.0)),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child:  IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
      ),
    ],
    bottom: TabBar(
      isScrollable: true,
      enableFeedback: true,
      tabs: const [
        Tab(
          child: Text("Clientes"),
        ),
        Tab(
          child: Text("Produtos"),
        ),
        Tab(
          child: Text("Fornecedores"),
        ),
        Tab(
          child: Text("Vendas"),
        ),
      ],
      indicatorColor: Colors.black,
      controller: tabController,
    ),
  );
}
