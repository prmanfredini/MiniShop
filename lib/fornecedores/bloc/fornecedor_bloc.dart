import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/service/fornecedores_service.dart';

class FornecedorBloc {
  void EditarFornecedor(
      int id,
      String companyName,
      String contactName,
      String? contactTitle,
      String city,
      String country,
      String phone,
      String? fax) {
    FornecedorModel fornecedor = FornecedorModel(
      id: id,
      companyName: companyName,
      contactName: contactName,
      contactTitle: contactTitle,
      city: city,
      country: country,
      phone: phone,
      fax: fax,
    );
    print(fornecedor.toJson());
    // clienteService().putClientesById(cliente);
  }

  void cadastrarFornecedor(
    BuildContext context,
    int id,
    String companyName,
    String contactName,
    String? contactTitle,
    String city,
    String country,
    String phone,
    String? fax,
  ) {
    FornecedorModel fornecedor = FornecedorModel(
      id: id,
      companyName: companyName,
      contactName: contactName,
      contactTitle: contactTitle,
      city: city,
      country: country,
      phone: phone,
      fax: fax,
    );
    FornecedorService().cadastrarFornecedor(fornecedor).then((value) => onComplete(context, 'Cliente ${fornecedor.companyName}\n$value'));
  }

  void editarFornecedor(
      BuildContext context,
      int id,
      String companyName,
      String contactName,
      String? contactTitle,
      String city,
      String country,
      String phone,
      String? fax,
      ) {
    FornecedorModel fornecedor = FornecedorModel(
      id: id,
      companyName: companyName,
      contactName: contactName,
      contactTitle: contactTitle,
      city: city,
      country: country,
      phone: phone,
      fax: fax,
    );
    FornecedorService().editarFornecedor(fornecedor).then((value) => onComplete(context, 'Cliente ${fornecedor.companyName}\n$value'));
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
