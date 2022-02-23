import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';

class ClienteBloc {

  void CadastrarCliente(String firstName, String lastName, String city, String country, String phone) {
    ClienteModel cliente = ClienteModel(
      id: 1,
      firstName: firstName,
      lastName: lastName,
      city: city,
      country: country,
      phone: phone,
    );
    print(cliente.toJson());
    //clienteService().cadastrarCliente(cliente);
  }

  void EditarCliente(int id, String firstName, String lastName, String city, String country, String phone) {
    ClienteModel cliente = ClienteModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      city: city,
      country: country,
      phone: phone,
    );
    print(cliente.toJson());
    // clienteService().putClientesById(cliente);
  }

}

