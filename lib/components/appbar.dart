import 'package:flutter/material.dart';

appBarBuilder(String _label, GlobalKey<ScaffoldState> key) {
  return AppBar(
    toolbarHeight: 100,
    leading: Transform(
      transform: Matrix4.translationValues(0.0, 36.0, 0.0),
      child: IconButton(
          onPressed: () {
            key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu_outlined)),
    ),
    title: Transform(
      transform: Matrix4.translationValues(0.0, 36.0, 0.0),
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
        transform: Matrix4.translationValues(0, 36, 0),
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_outlined)),
        ),
      ),
    ],
    //bottom: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('algo'),),
  );
}
