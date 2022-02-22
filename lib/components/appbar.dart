import 'package:flutter/material.dart';

AppBarBuilder(String _label) {
  return AppBar(
    toolbarHeight: 100,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          //height: 32,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(_label, style: TextStyle(fontSize: 22.0)),
        )
      ],
    ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: IconButton(
            onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
      ),
    ],
    //bottom: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('algo'),),
  );
}
