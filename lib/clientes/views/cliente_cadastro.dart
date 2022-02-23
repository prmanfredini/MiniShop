import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/bloc/clientes_bloc.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';

class ClienteCadastro extends StatefulWidget {
  String? dropdownValue;

  @override
  State<ClienteCadastro> createState() => _HomeState();
}

class _HomeState extends State<ClienteCadastro>
    with SingleTickerProviderStateMixin {
  final ClienteBloc _clienteBloc = ClienteBloc();
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                      child: FormText(firstNameController, 'Nome'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: FormText(lastNameController, 'Sobrenome'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            child: FormText(cityController, 'Cidade'),
                          ),
                          SizedBox(
                            width: 120,
                            child: FormText(countryController, 'País'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 64.0, left: 64.0, top: 16.0),
                      child: FormText(phoneController, 'Telefone'),
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
                      _clienteBloc.CadastrarCliente(
                        firstNameController.text,
                        lastNameController.text,
                        cityController.text,
                        countryController.text,
                        phoneController.text,
                      );
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
