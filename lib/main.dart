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

      primaryColor: Color(0xffa66b97),
      secondaryHeaderColor: Color(0xffd9d9d9),
      colorScheme: ColorScheme.light().copyWith(
        primary: Color(0xffa66b97),
        secondary: Color(0xffa66b97),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xffa66b97),
        textTheme: ButtonTextTheme.primary,
      ));
}