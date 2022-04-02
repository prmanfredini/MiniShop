import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor_resquest.dart';
import 'package:flutter_pr/fornecedores/models/objeto_fornecedor.dart';
import 'package:flutter_pr/fornecedores/service/fornecedores_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FornecedorBloc {
  FornecedorService fornecedorService = FornecedorService();

  final _pageStateStream =
      StreamController<PagingState<int, Fornecedor>>.broadcast();

  Stream<PagingState<int, Fornecedor>> get streamPagingState =>
      _pageStateStream.stream;

  List<Fornecedor> fornecedores = [];

  Future<ObjetoFornecedor> getFornecedores(int index) async {
    var res = await fornecedorService.getFornecedores(index, 10);
    fornecedores.addAll(res.fornecedores);
    final isLastPage = index >= res.totalPages;
    final nextPageKey = isLastPage ? null : index + 1;

    _pageStateStream.sink.add(PagingState(
        error: null, nextPageKey: nextPageKey, itemList: fornecedores));
    return res;
  }

  void cadastrarFornecedor(
    BuildContext context,
    String companyName,
    String contactName,
    String? contactTitle,
    String city,
    String country,
    String phone,
    String? fax,
    GlobalKey<FormState> key,
  ) {
    if (key.currentState!.validate()) {
      FornecedorRequest fornecedor = FornecedorRequest(
        companyName: companyName,
        contactName: contactName,
        contactTitle: contactTitle,
        city: city,
        country: country,
        phone: phone,
        fax: fax,
      );
      FornecedorService().cadastrarFornecedor(fornecedor).then((value) =>
          onComplete(context, 'Cliente ${fornecedor.companyName}\n$value'));
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
