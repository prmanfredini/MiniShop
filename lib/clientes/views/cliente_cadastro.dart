import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';

class ClienteCadastro extends StatefulWidget {
  String? dropdownValue;

  @override
  State<ClienteCadastro> createState() => _HomeState();
}

class _HomeState extends State<ClienteCadastro>
    with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Pesquisar Clientes';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 32.0, left: 32.0, top: 64.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 500,
                height: 340,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 32.0),
                      child: TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            labelText: 'Nome',
                            fillColor: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Sobrenome',
                            labelText: 'Sobrenome',
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'Cidade',
                                  labelText: 'Cidade',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: countryController,
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'País',
                                  labelText: 'País',
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 64.0, left: 64.0, top: 16.0),
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Telefone',
                            labelText: 'Telefone',
                            fillColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: SizedBox(
                  width: 340,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ClienteModel cliente = ClienteModel(
                        id: 1,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        city: cityController.text,
                        country: countryController.text,
                        phone: phoneController.text,
                      );
                      print(cliente.toJson());
                      //clienteService().cadastrarCliente(cliente);
                    },
                    label: Text('Cadastrar'),
                    icon: Icon(Icons.add),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
