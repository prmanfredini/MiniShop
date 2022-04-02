import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor_resquest.dart';

import 'fornecedor_bloc.dart';

class EditarFornecedorBloc extends FornecedorBloc {
  late Fornecedor fornecedor;

  @override
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
      FornecedorRequest novoFornecedor = FornecedorRequest(
        companyName: companyName,
        contactName: contactName,
        contactTitle: contactTitle,
        city: city,
        country: country,
        phone: phone,
        fax: fax,
      );
      fornecedorService.editarFornecedor(novoFornecedor, fornecedor.id).then(
          (value) =>
              onComplete(context, 'Cliente ${novoFornecedor.companyName}\n$value'));
    }
  }
}
