import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/clientes/widgets/card_clientes.dart';

class CardClientes extends StatelessWidget {
  List<dynamic> clientesAPI = [];

  @override
  Widget build(BuildContext context) {
    clientesAPI.add(ClienteService().getClientes());
    print(clientesAPI.first);

    return FutureBuilder<List<ClienteModel>>(
      future: ClienteService().getClientes(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ClienteModel>> snapshot) {
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
            final List<ClienteModel> cliente = snapshot.data ?? [];
            if (snapshot.hasData) {

              return CardCliente(cliente: cliente);
            }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
