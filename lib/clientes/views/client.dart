import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/widgets/card_clientes.dart';

class CardClientes extends StatelessWidget {
  List<dynamic> clientes = [];

  @override
  Widget build(BuildContext context) {
    clientes.add(ClienteModel(
        id: 1, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 2, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 3, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 4, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 5, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 6, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 7, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));
    clientes.add(ClienteModel(
        id: 8, firstName: 'Rafael', lastName: 'Kikuchi', city: 'Belém', country: 'Brasil', phone: '(91) 99999-9999'));

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

