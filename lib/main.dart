import 'package:flutter/material.dart';

import 'Home/home.dart';

void main() {
  runApp(MiniShop());
}

class MiniShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: Home(),
    );
  }
}

ThemeData _buildTheme() {
  return ThemeData(
      primaryColor: Colors.purple[800],
      colorScheme: ColorScheme.light().copyWith(
        primary: Colors.purple[400],
        secondary: Colors.purpleAccent[300],
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.purple[700],
        textTheme: ButtonTextTheme.primary,
      ));
}