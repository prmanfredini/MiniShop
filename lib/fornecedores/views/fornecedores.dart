import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/service/fornecedores_service.dart';
import 'package:flutter_pr/fornecedores/widgets/card_fornecedores.dart';

class CardFornecedores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FornecedorModel>>(
      future: FornecedorService().getFornecedores(),
      builder: (BuildContext context, AsyncSnapshot<List<FornecedorModel>> snapshot) {
        print(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: Handle this case.
            break;
          case ConnectionState.waiting:
            return Container(
                height: 500,
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          case ConnectionState.active:
            // TODO: Handle this case.
            break;
          case ConnectionState.done:
            final List<FornecedorModel> fornecedor = snapshot.data ?? [];
            print('AQUIIII $fornecedor');
            if (snapshot.hasData) {
              return CardFornecedor(fornecedor: fornecedor);
            }
        }
        return Container(
            height: 500,
            alignment: Alignment.center,
            child: CircularProgressIndicator());
      },
    );
  }
}
