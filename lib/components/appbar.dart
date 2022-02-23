import 'package:flutter/material.dart';
import 'package:flutter_pr/components/drawer_builder.dart';

AppBarBuilder(String _label, GlobalKey<ScaffoldState> key) {
  return AppBar(
    toolbarHeight: 100,
    leading: Transform(
      transform: Matrix4.translationValues(0.0, 34.0, 0.0),
      child: IconButton(
          onPressed: () {
            key.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu_outlined)),
    ),
    title: Transform(
      transform: Matrix4.translationValues(0.0, 34.0, 0.0),
      child: Text(_label),
    ),
    flexibleSpace: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
    actions: <Widget>[
      Transform(
        transform: Matrix4.translationValues(0, 34, 0),
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
        ),
      ),
    ],
    //bottom: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('algo'),),
  );
}
