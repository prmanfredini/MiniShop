import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/bloc/clientes_bloc.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/components/phone_form_field.dart';

class ClienteCadastro extends StatelessWidget {
  final label = 'Cadastrar Clientes';
  final _clienteBloc = ClienteBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _key = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();

  ClienteCadastro({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: appBarBuilder(label, _scaffoldKey),
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
                child: Form(
                  key: _key,
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
                        child: PhoneFormField(
                            controller: phoneController,
                            label: 'Telefone',
                            formatter: TelefoneInputFormatter()),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: SizedBox(
                  width: 140,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _clienteBloc.cadastrarCliente(
                          context,
                          firstNameController.text,
                          lastNameController.text,
                          cityController.text,
                          countryController.text,
                          phoneController.text,
                          _key);
                    },
                    child: const Text('Cadastrar'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
