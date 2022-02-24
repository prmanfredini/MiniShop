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
    FornecedorService().cadastrarFornecedor(fornecedor);
  }

  void editarFornecedor(
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
    FornecedorService().editarFornecedor(fornecedor);
  }

}
