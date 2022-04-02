import 'package:flutter/material.dart';

import 'Home/home.dart';

void main() {
  runApp(const MiniShop());
}

class MiniShop extends StatelessWidget {
  const MiniShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const Home(),
    );
  }
}

ThemeData _buildTheme() {
  return ThemeData(

      primaryColor: const Color(0xffa66b97),
      secondaryHeaderColor: const Color(0xffd9d9d9),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xffa66b97),
        secondary: const Color(0xffffffff),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xffa66b97),
        textTheme: ButtonTextTheme.primary,
      ));
}