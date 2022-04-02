import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/clientes/models/objeto_cliente.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClienteBloc {
  ClienteService clienteService = ClienteService();

  final _pageStateStream =
      StreamController<PagingState<int, ClienteModel>>.broadcast();

  Stream<PagingState<int, ClienteModel>> get streamPagingState =>
      _pageStateStream.stream;

  List<ClienteModel> clientes = [];

  Future<ObjetoCliente> getClientes(int index) async {

    var res = await clienteService.getClientes(index, 10);
    clientes.addAll(res.clientes);
    final isLastPage = index >= res.totalPages;
    final nextPageKey = isLastPage ? null : index + 1;
    _pageStateStream.sink.add(
        PagingState(error: null, nextPageKey: nextPageKey, itemList: clientes));
    return res;
  }

  void cadastrarCliente(
      BuildContext context,
      String firstName,
      String lastName,
      String city,
      String country,
      String phone,
      GlobalKey<FormState> key) {

    if (key.currentState!.validate()) {
      ClienteModel cliente = ClienteModel(
        id: 1,
        firstName: firstName,
        lastName: lastName,
        city: city,
        country: country,
        phone: phone,
      );

      ClienteService().cadastrarCliente(cliente).then((value) => onComplete(
          context,
          'Cliente ${cliente.firstName} ${cliente.lastName} \n$value'));
    }
  }

  void editarCliente(
      BuildContext context,
      int id,
      String firstName,
      String lastName,
      String city,
      String country,
      String phone,
      GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      ClienteModel cliente = ClienteModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        city: city,
        country: country,
        phone: phone,
      );
      ClienteService().editarClientes(cliente).then((value) => onComplete(
          context,
          'Cliente ${cliente.firstName} ${cliente.lastName} \n$value'));
    }
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
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  void dispose() {
    _pageStateStream.close();
  }
}
