import 'package:flutter/material.dart';

AppBarBuilder() {
  return AppBar(
    toolbarHeight: 100,
    title: Text('MiniShop', style: TextStyle(fontSize: 22.0)),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child:  IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
      ),
    ],
    //bottom: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('algo'),),
  );
}
