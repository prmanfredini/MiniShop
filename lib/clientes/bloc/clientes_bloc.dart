import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';

class ClienteBloc {

  void CadastrarCliente(BuildContext context, String firstName, String lastName, String city, String country, String phone) {
    ClienteModel cliente = ClienteModel(
      id: 1,
      firstName: firstName,
      lastName: lastName,
      city: city,
      country: country,
      phone: phone,
    );
    print(cliente.toJson());
    ClienteService().cadastrarCliente(cliente).then((value) => onComplete(context, 'Cliente ${cliente.firstName} ${cliente.lastName} \n$value'));
  }

  void EditarCliente(BuildContext context, id, String firstName, String lastName, String city, String country, String phone) {

    ClienteModel cliente = ClienteModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      city: city,
      country: country,
      phone: phone,
    );
    print(cliente.toJson());
    ClienteService().editarClientes(cliente).then((value) => onComplete(context, 'Cliente ${cliente.firstName} ${cliente.lastName} \n$value'));
  }

  onComplete(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

}

