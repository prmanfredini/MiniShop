
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';



class CardClientes extends StatelessWidget {


  List<clienteModel> clientes = [];


  @override
  Widget build(BuildContext context) {
    clientes.add(clienteModel(
        1, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        2, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        3, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        4, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        5, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        6, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        7, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        8, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        9, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));
    clientes.add(clienteModel(
        10, 'Rafael', 'Kikuchi', 'Belém', 'Brasil', '(91) 99999-9999'));

    return GridView.builder(
      shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        physics: ScrollPhysics(),
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: Column(
              children: [
                Text('${clientes[index].firstName.toString()} ${clientes[index].lastName.toString()}', style: TextStyle(fontSize: 32.0),)
              ],
            ),
          );
        }
    );
  }
}