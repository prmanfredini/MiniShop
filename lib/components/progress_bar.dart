import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String mensagem;

  const ProgressBar({Key? key, this.mensagem = 'Carregando'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              mensagem,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
