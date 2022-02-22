import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/widgets/card_clientes.dart';

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
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5.5 / 4,
        ),
        physics: ScrollPhysics(),
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          // Detalhes do Card de Clientes
          var _title = '${clientes[index].firstName} ${clientes[index].lastName}';
          var _phone = clientes[index].phone;
          var _place = '${clientes[index].city} - ${clientes[index].country}';

          return Card_Clientes(title: _title, phone: _phone, place: _place);
        });
  }
}

